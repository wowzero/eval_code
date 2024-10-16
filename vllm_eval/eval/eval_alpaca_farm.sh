
CHECKPOINT_PATH=simonycl/self-seq-Llama-2-7b-hf-new

for CHECKPOINT_PATH in output/self-seq-Meta-Llama-3-8B-tulu100k_base_ours_new_llama70b
do
    MODEL_NAME=$(basename $CHECKPOINT_PATH)
    # AlpacaEval
    # python3 -m eval.alpaca_farm.run_eval \
    #     --model_name_or_path $CHECKPOINT_PATH \
    #     --save_dir results/alpaca_farm/${MODEL_NAME} \
    #     --eval_batch_size 20 \
    #     --max_new_tokens 2048 \
    #     --use_vllm \
    #     --use_chat_format \
    #     --chat_formatting_function tulu

    # for REF in gpt-4
    # do
    #     python3 -m eval.alpaca_farm.reward \
    #         --input_file results/alpaca_farm/${MODEL_NAME}/${MODEL_NAME}-greedy-long-output.json \
    #         --ref_file results/alpaca_farm/${REF}/alpaca_eval_reward.json
    # done

    # check if sequential_instruction_tuning/SeqAlpacaEval/alpaca_eval_gpt4_baseline.seq.json exists
    # if [ -f "sequential_instruction_tuning/SeqAlpacaEval/alpaca_eval_gpt4_baseline.seq.json" ]; then
    #     echo "AlpacaEval file exists"
    # else
    #     git clone https://github.com/PinzhenChen/sequential_instruction_tuning.git
    # fi

    python3 -m eval.alpaca_farm.run_seq_eval \
        --model_name_or_path $CHECKPOINT_PATH \
        --save_dir results/alpaca_farm/${MODEL_NAME} \
        --eval_batch_size 20 \
        --max_new_tokens 2048 \
        --use_vllm \
        --prompt_path sequential_instruction_tuning/SeqAlpacaEval/seqEval.json \
        --use_chat_format \
        --chat_formatting_function tulu


    # python3 -m eval.alpaca_farm.reward \
    #         --input_file results/alpaca_farm/${MODEL_NAME}/${MODEL_NAME}-seq-eval-greedy-long-output.json
done
