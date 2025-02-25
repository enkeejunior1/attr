echo "gpu_ids: $1"
echo "gen_seed: $2"
echo "setting: $3"

export HF_HOME="~/codes/.cache/huggingface"

CUDA_VISIBLE_DEVICES=$1 python3 gen_unconditional.py \
    --dataset_name="cifar10" \
    --dataloader_num_workers=8 \
    --model_config_name_or_path="config.json" \
    --train_batch_size=256 \
    --model_path=./saved/$3/ddpm \
    --gen_seed=$2 \
    --output_dir=./saved/$3/gen

