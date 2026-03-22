
# activate conda
source ~/miniconda3/bin/activate
conda activate robot37


python3 scripts/main_droid_dreamzero.py --remote_host=10.140.60.188 --remote_port=5000 --external_camera="left" --action_space="joint_position" --observation_space="joint_position"
