
# activate conda
source ~/miniconda3/bin/activate
conda activate robot37

# pi 系列
python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="joint_velocity"
# groot 系列
# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="joint_position"
# 自己训得模型
# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="cartesian_velocity"

