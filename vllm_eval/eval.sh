model_path=$1

tmp=(${model_path//"/"/ })

bash eval_auto_mistral.sh ${model_path} ${tmp[-2]}_${tmp[-1]}

