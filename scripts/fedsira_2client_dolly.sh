# all for lora
python main.py --global_model 'chavinlo/alpaca-native'\
      --data_path  "./data" \
      --output_dir  './lora-shepherd-7b-all-r8-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  2 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  64 \
      --local_micro_batch_size 32 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[q_proj,k_proj,v_proj,o_proj]' \
      --train_on_inputs \
      --group_by_length \
      --aggregator "fedsira"

# all for lora
python main.py --global_model 'chavinlo/alpaca-native'\
      --data_path  "./data" \
      --output_dir  './lora-shepherd-7b-q-r8-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  2 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  64 \
      --local_micro_batch_size 32 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[q_proj]' \
      --train_on_inputs \
      --group_by_length \
      --aggregator "fedsira"
 

# all for lora
python main.py --global_model 'chavinlo/alpaca-native'\
      --data_path  "./data" \
      --output_dir  './lora-shepherd-7b-k-r8-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  2 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  64 \
      --local_micro_batch_size 32 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[k_proj]' \
      --train_on_inputs \
      --group_by_length \
      --aggregator "fedsira"

# all for lora
python main.py --global_model 'chavinlo/alpaca-native'\
      --data_path  "./data" \
      --output_dir  './lora-shepherd-7b-v-r8-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  2 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  64 \
      --local_micro_batch_size 32 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[v_proj]' \
      --train_on_inputs \
      --group_by_length \
      --aggregator "fedsira"

# all for lora
python main.py --global_model 'chavinlo/alpaca-native'\
      --data_path  "./data" \
      --output_dir  './lora-shepherd-7b-o-r8-fedsira/'\
      --device_map 'auto' \
      --num_communication_rounds 20 \
      --num_clients  2 \
      --client_selection_frac 1.0 \
      --local_num_epochs  2 \
      --local_batch_size  64 \
      --local_micro_batch_size 32 \
      --local_learning_rate 0.0003 \
      --lora_r 8 \
      --lora_target_modules='[o_proj]' \
      --train_on_inputs \
      --group_by_length  \
      --aggregator "fedsira"
