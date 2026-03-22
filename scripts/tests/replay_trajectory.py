from droid.robot_env import RobotEnv
from droid.trajectory_utils.misc import replay_trajectory

trajectory_folderpath = "/app/aaa/data/raw_data/all_data/put_the_blue_cube_in_the_red_cup/success/2026-03-02/Mon_Mar__2_16:11:33_2026"
action_space = "joint_velocity"
# action_space = "joint_position"


# Make the robot env
env = RobotEnv(action_space=action_space)
print(env.control_hz)
# Replay Trajectory #
h5_filepath = trajectory_folderpath + "/trajectory.h5"
replay_trajectory(env, filepath=h5_filepath)
