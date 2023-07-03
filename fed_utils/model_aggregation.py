from peft import (
    set_peft_model_state_dict,
)
import torch
import os
from torch.nn.functional import normalize


def FedAvg(model, selected_clients_set, output_dir, local_dataset_len_dict, epoch):
    weights_array = normalize(
        torch.tensor([local_dataset_len_dict[client_id] for client_id in selected_clients_set],
                     dtype=torch.float32),
        p=1, dim=0)

    for k, client_id in enumerate(selected_clients_set):
        single_output_dir = os.path.join(output_dir, str(epoch), "local_output_{}".format(client_id),
                                         "pytorch_model.bin")
        single_weights = torch.load(single_output_dir)
        if k == 0:
            weighted_single_weights = {key: single_weights[key] * (weights_array[k]) for key in
                                       single_weights.keys()}
        else:
            weighted_single_weights = {key: weighted_single_weights[key] + single_weights[key] * (weights_array[k])
                                       for key in
                                       single_weights.keys()}

    set_peft_model_state_dict(model, weighted_single_weights, "default")

    return model

def FedSiRA(model, selected_clients_set, output_dir, local_dataset_len_dict, epoch):
    # SiRA: Singular Rank Aggregator of Federated LoRA
    weights_array = normalize(
        torch.tensor([local_dataset_len_dict[client_id] for client_id in selected_clients_set],
                     dtype=torch.float32),
        p=1, dim=0)

    for k, client_id in enumerate(selected_clients_set):
        single_output_dir = os.path.join(output_dir, str(epoch), "local_output_{}".format(client_id),
                                         "pytorch_model.bin")
        single_weights = torch.load(single_output_dir)
        if k == 0:
            weighted_single_weights = {key: single_weights[key] * (weights_array[k]) for key in
                                       single_weights.keys()}
        else:
            weighted_single_weights = {key: weighted_single_weights[key] + single_weights[key] * (weights_array[k])
                                       for key in
                                       single_weights.keys()}

    weighted_single_weights = {key: normalize_weights(weighted_single_weights[key]) for key in
                                 weighted_single_weights.keys()}

    set_peft_model_state_dict(model, weighted_single_weights, "default")

    return model

def normalize_weights(weights):
    U, S, V = torch.linalg.svd(weights)
    r, c = weights.shape
    if r > c:
        return torch.matmul(U[:, :c], torch.diag_embed(S))
    else:
        return torch.matmul(torch.diag_embed(S), V[:r])