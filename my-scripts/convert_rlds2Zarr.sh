source ~/miniconda3/bin/activate
conda activate rlds_env

# LANGUAGE_INSTRUCTION=put_the_blue_cube_in_the_red_cup
# INPUT_DIR=/app/aaa/data/rlds_data/put_the_blue_cube_in_the_red_cup/tensorflow_datasets/droid

# LANGUAGE_INSTRUCTION=test
# INPUT_DIR=/app/aaa/data/rlds_data/test/tensorflow_datasets/droid

LANGUAGE_INSTRUCTION=put_the_blue_cube_in_the_red_cup2
INPUT_DIR=/app/aaa/data/rlds_data/put_the_blue_cube_in_the_red_cup2/tensorflow_datasets/droid
# python /app/tyh/convert_rlds2Zarr.py --action_space joint_velocity --obs_space joint_position --name ${LANGUAGE_INSTRUCTION} --input_dir ${INPUT_DIR}
python /app/tyh/convert_rlds2Zarr.py --action_space joint_position --obs_space joint_position --name ${LANGUAGE_INSTRUCTION} --input_dir ${INPUT_DIR}
python /app/tyh/convert_rlds2Zarr.py --action_space cartesian_velocity --obs_space joint_position --name ${LANGUAGE_INSTRUCTION} --input_dir ${INPUT_DIR}
python /app/tyh/convert_rlds2Zarr.py --action_space cartesian_position --obs_space joint_position --name ${LANGUAGE_INSTRUCTION} --input_dir ${INPUT_DIR}
