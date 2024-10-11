# Evaluation Script
## environment
请分别进入"llm-evaluation-harness","opencompass"参考readme配置环境

## evaluation
针对下列任务，请分别遵照以下指令运行脚本
  ```bash
gsm8k Math mbpp	humaneval NQ winogrande bbh  mmlu  hellaswag
  ```
### gsm8k
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh gsm8k_cot ${your_model} 8 
  ```
### math
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh minerva_math ${your_model} 4
  ```

### mbpp
  ```bash
cd ./opencompass/submit/
bash eval.sh ${your_model} sanitized_mbpp_gen_742f0c
  ```

### humaneval
  ```bash
cd ./vllm_eval/submit/
bash eval.sh ${your_model}
  ```

### NQ
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh nq_open ${your_model} 5
  ```

### winogrande
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh nq_open ${your_model} 5
  ```

### bbh
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh bbh ${your_model} 3
  ```

### mmlu
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh mmlu ${your_model} 5
  ```


### hellaswag
  ```bash
cd ./llm-evaluation-harness/our_script/
bash eval.sh hellaswag ${your_model} 5
  ```