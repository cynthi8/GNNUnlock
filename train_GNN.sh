cd "GraphSAINT"
graph_dir="../Graph"
config_file="../DATE21.yml"
python3 -m graphsaint.tensorflow_version.train --data_prefix $graph_dir --train_config $config_file --gpu -1 > log_training.txt
cd ..