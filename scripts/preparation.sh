# conda create --name fedit python=3.9
# conda update --all
# pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
# pip install -r requirements.txt

# Data_preparation
num_client=8 # The number of clients
diff_quantity=0 # Whether clients have different amounts of data
num_shards_per_clients=1 
python client_data_allocation.py $num_client $diff_quantity $num_shards_per_clients


##### Example 1 with two clients
# python client_data_allocation.py 2 0 1
#  Generating the local training dataset of Client_0
# open_qa                   3601
# information_extraction    1502
# summarization             1253
# general_qa                1111
# Name: category, dtype: int64 ['general_qa' 'information_extraction' 'open_qa' 'summarization'] 7467

###### Generating the local training dataset of Client_1
# classification      2126
# closed_qa           1813
# brainstorming       1758
# general_qa          1070
# creative_writing     701
# Name: category, dtype: int64 ['brainstorming' 'classification' 'closed_qa' 'creative_writing'
#  'general_qa'] 7468


##### Example 5 with four clients
# python client_data_allocation.py 4 0 1
#  Generating the local training dataset of Client_0
# category
# classification    1976
# brainstorming     1758
# Name: count, dtype: int64 ['brainstorming' 'classification'] 3734

#  Generating the local training dataset of Client_1
# category
# open_qa          2480
# summarization    1253
# Name: count, dtype: int64 ['open_qa' 'summarization'] 3733

#  Generating the local training dataset of Client_2
# category
# information_extraction    1502
# open_qa                   1121
# general_qa                1111
# Name: count, dtype: int64 ['general_qa' 'information_extraction' 'open_qa'] 3734

#  Generating the local training dataset of Client_3
# category
# closed_qa           1813
# general_qa          1070
# creative_writing     701
# classification       150
# Name: count, dtype: int64 ['classification' 'closed_qa' 'creative_writing' 'general_qa'] 3734

##### Example 3 with eight clients
# python client_data_allocation.py 8 0 1
#  Generating the local training dataset of Client_0
# brainstorming    1758
# Name: category, dtype: int64 ['brainstorming'] 1758

#  Generating the local training dataset of Client_1
# classification    2126
# Name: category, dtype: int64 ['classification'] 2126

#  Generating the local training dataset of Client_2
# closed_qa    1813
# Name: category, dtype: int64 ['closed_qa'] 1813

#  Generating the local training dataset of Client_3
# creative_writing    701
# Name: category, dtype: int64 ['creative_writing'] 701

#  Generating the local training dataset of Client_4
# general_qa    2181
# Name: category, dtype: int64 ['general_qa'] 2181

#  Generating the local training dataset of Client_5
# information_extraction    1502
# Name: category, dtype: int64 ['information_extraction'] 1502

#  Generating the local training dataset of Client_6
# open_qa    3601
# Name: category, dtype: int64 ['open_qa'] 3601

#  Generating the local training dataset of Client_7
# summarization    1253
# Name: category, dtype: int64 ['summarization'] 1253