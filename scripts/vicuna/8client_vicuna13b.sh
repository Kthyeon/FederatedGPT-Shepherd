# # all for lora
# python main.py --global_model 'lmsys/vicuna-13b-v1.3'\
#       --data_path  "./data" \
#       --output_dir  '/data/taehyeon/models/vicuna13b-all-r8-8cli/'\
#       --device_map 'auto' \
#       --num_communication_rounds 20 \
#       --num_clients  8 \
#       --client_selection_frac 1.0 \
#       --local_num_epochs  2 \
#       --local_batch_size  60 \
#       --local_micro_batch_size 60 \
#       --local_learning_rate 0.0003 \
#       --lora_r 8 \
#       --lora_target_modules='[q_proj,k_proj,v_proj,o_proj]' \
#       --train_on_inputs \
#       --group_by_length

# # all for lora
# python main.py --global_model 'lmsys/vicuna-13b-v1.3'\
#       --data_path  "./data" \
#       --output_dir  '/data/taehyeon/models/vicuna13b-q-r8-8cli/'\
#       --device_map 'auto' \
#       --num_communication_rounds 20 \
#       --num_clients  8 \
#       --client_selection_frac 1.0 \
#       --local_num_epochs  2 \
#       --local_batch_size  60 \
#       --local_micro_batch_size 60 \
#       --local_learning_rate 0.0003 \
#       --lora_r 8 \
#       --lora_target_modules='[q_proj]' \
#       --train_on_inputs \
#       --group_by_length

# all for lora
python main.py --global_model 'lmsys/vicuna-13b-v1.3'\
      --data_path  "./data" \
      --output_dir  './vicuna13b-all-r8-8cli-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  8 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  60 \
      --local_micro_batch_size 60 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[q_proj,k_proj,v_proj,o_proj]' \
      --train_on_inputs \
      --group_by_length \
      --aggregator "fedsira"

# all for lora
python main.py --global_model 'lmsys/vicuna-13b-v1.3'\
      --data_path  "./data" \
      --output_dir  './vicuna13b-q-r8-8cli-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  8 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  60 \
      --local_micro_batch_size 60 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[q_proj]' \
      --train_on_inputs \
      --group_by_length \
      --aggregator "fedsira"
 

# # all for lora
# python main.py --global_model 'chavinlo/alpaca-native'\
#       --data_path  "./data" \
#       --output_dir  '/data/taehyeon/models/llama2chat7b-k-r8-8cli/'\
#       --device_map 'auto' \
#       --num_communication_rounds 20 \
#       --num_clients  8 \
#       --client_selection_frac 1.0 \
#       --local_num_epochs  2 \
#       --local_batch_size  60 \
#       --local_micro_batch_size 60 \
#       --local_learning_rate 0.0003 \
#       --lora_r 8 \
#       --lora_target_modules='[k_proj]' \
#       --train_on_inputs \
#       --group_by_length 

# # all for lora
# python main.py --global_model 'llamaste/Llama-2-7b-chat-hf'\
#       --data_path  "./data" \
#       --output_dir  '/data/taehyeon/models/llama2chat7b-v-r8-8cli/'\
#       --device_map 'auto' \
#       --num_communication_rounds 20 \
#       --num_clients  8 \
#       --client_selection_frac 1.0 \
#       --local_num_epochs  2 \
#       --local_batch_size  60 \
#       --local_micro_batch_size 60 \
#       --local_learning_rate 0.0003 \
#       --lora_r 8 \
#       --lora_target_modules='[v_proj]' \
#       --train_on_inputs \
#       --group_by_length 

# # all for lora
# python main.py --global_model 'llamaste/Llama-2-7b-chat-hf'\
#       --data_path  "./data" \
#       --output_dir  '/data/taehyeon/models/llama2chat7b-7b-o-r8-8cli/'\
#       --device_map 'auto' \
#       --num_communication_rounds 20 \
#       --num_clients  8 \
#       --client_selection_frac 1.0 \
#       --local_num_epochs  2 \
#       --local_batch_size  60 \
#       --local_micro_batch_size 60 \
#       --local_learning_rate 0.0003 \
#       --lora_r 8 \
#       --lora_target_modules='[o_proj]' \
#       --train_on_inputs \
#       --group_by_length  