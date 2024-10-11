CHECKPOINT_PATH=$1
MODEL_NAME=$2

export IS_ALPACA_EVAL_2=False

# # # TyDiQA
# python3 -m eval.tydiqa.run_eval \
#     --data_dir data/eval/tydiqa/ \
#     --n_shot 1 \
#     --max_num_examples_per_lang 100 \
#     --max_context_length 512 \
#     --save_dir results/tydiqa/${MODEL_NAME} \
#     --model $CHECKPOINT_PATH \
#     --tokenizer $CHECKPOINT_PATH \
#     --eval_batch_size 4 \
#     --use_chat_format \
#     --chat_formatting_function eval.templates.create_prompt_with_tulu_chat_format

# GSM8K 8 shot

# python3 -m eval.mgsm.run_eval \
#     --data_dir data/eval/mgsm/ \
#     --save_dir results/mgsm/${MODEL_NAME}-cot-8shot \
#     --model $CHECKPOINT_PATH \
#     --tokenizer $CHECKPOINT_PATH \
#     --n_shot 8 \
#     --mode no-cot \
#     --use_vllm


# MGSM 8 shot
# python3 -m eval.mgsm.run_eval \
#     --data_dir data/eval/mgsm/ \
#     --save_dir results/mgsm/${MODEL_NAME}-cot-8shot \
#     --model $CHECKPOINT_PATH \
#     --tokenizer $CHECKPOINT_PATH \
#     --n_shot 8 \
#     --mode cot \
#     --use_vllm

# # MGSM 8 shot

# CodeEval
python -m codex_humaneval.run_eval \
    --data_file data/eval/codex_humaneval/HumanEval.jsonl.gz \
    --eval_pass_at_ks 1 \
    --unbiased_sampling_size_n 1 \
    --temperature 0.1 \
    --save_dir results/codex_humaneval/{$MODEL_NAME}_temp_0_1_p1 \
    --model $CHECKPOINT_PATH \
    --tokenizer $CHECKPOINT_PATH \
    --use_vllm \


## math
#python -m eval.math.run_eval \
#    --n_shot 11 \
#    --eval_batch_size 1 \
#    --save_dir results/math/{$MODEL_NAME}_shot_11 \
#    --model $CHECKPOINT_PATH \
#    --tokenizer $CHECKPOINT_PATH \
#    --use_vllm \

# # AlpacaEval
# python3 -m eval.alpaca_farm.run_eval \
#     --model_name_or_path $CHECKPOINT_PATH \
#     --save_dir results/alpaca_farm/${MODEL_NAME} \
#     --eval_batch_size 20 \
#     --max_new_tokens 1024 \
#     --use_vllm \
#     --use_chat_format \
#     --chat_formatting_function mistral
