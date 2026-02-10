from droid.trajectory_utils.misc import visualize_trajectory

trajectory_folderpath = "/app/data/success/2026-01-09/Fri_Jan__9_06:16:56_2026"

camera_kwargs = dict(
    hand_camera=dict(image=True, resolution=(0, 0)),
    varied_camera=dict(image=True, resolution=(0, 0)),
)

h5_filepath = trajectory_folderpath + "/trajectory.h5"
recording_folderpath = trajectory_folderpath + "/recordings/SVO"
visualize_trajectory(filepath=h5_filepath, recording_folderpath=recording_folderpath, camera_kwargs=camera_kwargs)
