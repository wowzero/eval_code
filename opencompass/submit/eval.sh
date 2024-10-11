model=${1}
task=${2}

python run.py --datasets $task --hf-type base --hf-path $model -w ./outputs/$task -a lmdeploy