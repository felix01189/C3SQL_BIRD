set -e

tables="/datasets/bird/dev_tables.json"
dataset_path="/datasets/bird/dev_5.json"
db_dir="/datasets/bird/dev_databases"
output_dataset_path="predicted_sql_bird.txt"
openai_key=`cat openai_key.txt`
processed_dataset_path="./generate_datasets/C3_dev.json"
evidence_option="option3"

# preprocess data
bash scripts/prepare_dataset.sh $tables $dataset_path $db_dir $processed_dataset_path $openai_key $evidence_option
# run prediction
python src/generate_sqls_by_gpt3.5.py --input_dataset_path $processed_dataset_path  --output_dataset_path $output_dataset_path --db_dir $db_dir --openai_key $openai_key

