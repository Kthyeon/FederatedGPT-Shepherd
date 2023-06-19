# conda create --name fedit python=3.9
# conda update --all
# pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
pip install -r requirements.txt

# Data_preparation
num_client=2 # The number of clients
diff_quantity=0 # Whether clients have different amounts of data
num_shards_per_clients=1 
python client_data_allocation.py $num_client $diff_quantity


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