# 1.调整/app/droid_dataset_builder/droid/droid.py里的LANGUAGE_INSTRUCTION变量
# 注意是将/app/data/success目录下的所有数据转换


source ~/miniconda3/bin/activate
conda activate rlds_env

cd /app/droid_dataset_builder/droid

LANGUAGE_INSTRUCTION=put_the_blue_cube_in_the_red_cup2
# LANGUAGE_INSTRUCTION=put_the_blue_cube_in_the_red_cup


tfds build --overwrite --data_dir=/app/aaa/data/rlds_data/${LANGUAGE_INSTRUCTION}/tensorflow_datasets/droid