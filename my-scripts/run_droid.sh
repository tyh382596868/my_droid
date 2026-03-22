
# activate conda
source ~/miniconda3/bin/activate
conda activate robot37

# put the blue cube in the red cup
python3 scripts/main_droid.py --remote_host=10.140.66.145 --remote_port=8000 --external_camera="left" --action_space="joint_velocity" --observation_space="joint_position" --open_loop_horizon 8


# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="joint_velocity" --observation_space="joint_position" --open_loop_horizon 16

# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="joint_position" --observation_space="joint_position" --open_loop_horizon 16

# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="cartesian_position" --observation_space="joint_position" --open_loop_horizon 8

# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="cartesian_velocity" --observation_space="joint_position" --open_loop_horizon 8


# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="cartesian_position" --observation_space="cartesian_position"
# 



# pi 系列
# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="joint_velocity"
# groot 系列
# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="joint_position"
# 自己训得模型
# python3 scripts/main_droid.py --remote_host=localhost --remote_port=8000 --external_camera="left" --action_space="cartesian_velocity"

