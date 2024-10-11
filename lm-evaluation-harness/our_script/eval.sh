task=${1}
model_path=${2}
num_fewshot=${3}
gpu_memory_utilization=${4:-0.8}

lm_eval --model vllm \
    --model_args pretrained=${model_path},dtype=auto,gpu_memory_utilization=${gpu_memory_utilization} \
    --tasks ${task} \
    --batch_size auto \
    --output_path ./${task}_${num_fewshot} \
    --log_samples \
    --write_out \
    --num_fewshot ${num_fewshot}
