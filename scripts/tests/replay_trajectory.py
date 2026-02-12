from droid.robot_env import RobotEnv
from droid.trajectory_utils.misc import replay_trajectory

trajectory_folderpath = "/app/data/success/2026-02-10/Tue_Feb_10_12:51:38_2026"
action_space = "joint_position"

# Make the robot env
env = RobotEnv(action_space=action_space)

# Replay Trajectory #
h5_filepath = trajectory_folderpath + "/trajectory.h5"
replay_trajectory(env, filepath=h5_filepath)
