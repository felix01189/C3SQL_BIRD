set -e

tables="/datasets/spider/tables.json"
dataset_path="/datasets/spider/test_data/dev.json"
db_dir="/datasets/spider/test_database"
output_dataset_path="predicted_sql_spider.txt"
openai_key=`cat openai_key.txt`
processed_dataset_path="./generate_datasets/C3_dev.json"

# preprocess data
bash scripts/prepare_dataset.sh $tables $dataset_path $db_dir $processed_dataset_path $openai_key
# run prediction
python src/generate_sqls_by_gpt3.5.py --input_dataset_path $processed_dataset_path  --output_dataset_path $output_dataset_path --db_dir $db_dir --openai_key $openai_key

