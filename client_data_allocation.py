import sys
import pandas as pd
import numpy as np
import random
import os
import json
import pdb

num_clients = int(sys.argv[1])
diff_quantity = int(sys.argv[2])
num_shards_per_clients = int(sys.argv[3])

np.random.seed(2023)
random.seed(2023)

# Divide the entire dataset into a training set and a test set.
df = pd.read_json("new-databricks-dolly-15k.json", orient='records')

sorted_df = df.sort_values(by=['category'])
grouped = sorted_df.groupby('category')

# To make test dataset more balanced, we sample 10 data points from each category
sampled_df = grouped.apply(lambda x: x.sample(n=10))
sampled_df = sampled_df.reset_index(level=0, drop=True)
# The remaining data points are used for training
remaining_df = sorted_df.drop(index=sampled_df.index)


sampled_df = sampled_df.reset_index().drop('index', axis=1)
remaining_df = remaining_df.reset_index().drop('index', axis=1)
data_path = os.path.join("data", str(num_clients))
os.makedirs(data_path,exist_ok=True)

# Save the global training dataset and the global test dataset
remaining_df_dic = remaining_df.to_dict(orient='records')
with open(os.path.join(data_path, "global_training.json"), 'w') as outfile:
    json.dump(remaining_df_dic, outfile)

sampled_df_dic = sampled_df.to_dict(orient='records')
with open(os.path.join(data_path, "global_test.json"), 'w') as outfile:
    json.dump(sampled_df_dic, outfile)

# Partition the global training data into smaller subsets for each client's local training dataset
if diff_quantity:
    # The number of data points in each client's local training dataset is different
    min_size = 0 # The minimum number of data points in each client's local training dataset
    min_require_size = 40 # The minimum number of data points in each client's local training dataset
    alpha = 0.1

    N = len(remaining_df)
    net_dataidx_map = {}
    category_uniques = remaining_df['category'].unique().tolist()
    while min_size < min_require_size:

        idx_partition = [[] for _ in range(num_clients)]
        for k in range(len(category_uniques)):
            category_rows_k = remaining_df.loc[remaining_df['category'] == category_uniques[k]]
            category_rows_k_index = category_rows_k.index.values
            np.random.shuffle(category_rows_k_index)
            proportions = np.random.dirichlet(np.repeat(alpha, num_clients))
            proportions = np.array([p * (len(idx_j) < N / num_clients) for p, idx_j in zip(proportions, idx_partition)])
            proportions = proportions / proportions.sum()
            proportions = (np.cumsum(proportions) * len(category_rows_k_index)).astype(int)[:-1]
            idx_partition = [idx_j + idx.tolist() for idx_j, idx in
                             zip(idx_partition, np.split(category_rows_k_index, proportions))]
            min_size = min([len(idx_j) for idx_j in idx_partition])

        print(min_size)

elif num_clients == 8:
    # one task per each client
    # assert if num_clients != number of categories != 8
    remaining_df_index = remaining_df.index.values
    category_uniques = remaining_df['category'].unique().tolist()
    assert len(category_uniques) == 8
    assert num_clients == len(category_uniques)

    idx_partition = []
    for k in range(len(category_uniques)):
        category_rows_k = remaining_df.loc[remaining_df['category'] == category_uniques[k]]
        category_rows_k_index = category_rows_k.index.values
        idx_partition.append(category_rows_k_index.tolist())
else:
    # The number of data points in each client's local training dataset is the same
    remaining_df_index = remaining_df.index.values
    shards = np.array_split(remaining_df_index, int(num_shards_per_clients * num_clients))
    random.shuffle(shards)

    shards = [shards[i:i + num_shards_per_clients] for i in range(0, len(shards), num_shards_per_clients)]
    idx_partition = [np.concatenate(shards[n]).tolist() for n in range(num_clients)]


for client_id, idx in enumerate(idx_partition):
    print(
        "\n Generating the local training dataset of Client_{}".format(client_id)
    )
    sub_remaining_df = remaining_df.loc[idx]
    sub_remaining_df = sub_remaining_df.reset_index().drop('index', axis=1)
    sub_remaining_df_dic = sub_remaining_df.to_dict(orient='records')
    print(sub_remaining_df['category'].value_counts(), sub_remaining_df['category'].unique(), len(sub_remaining_df))

    with open(os.path.join(data_path, "local_training_{}.json".format(client_id)), 'w') as outfile:
        json.dump(sub_remaining_df_dic, outfile)
