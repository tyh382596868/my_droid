import os
from cv2 import aruco

# Robot Params #
nuc_ip = "172.16.0.3"
robot_ip = "172.16.0.2"
laptop_ip = "172.16.0.1"
sudo_password = "1"
robot_type = "fr3"  # 'panda' or 'fr3'
robot_serial_number = "290102-250706"

# Camera ID's #
hand_camera_id = "17967083"
varied_camera_1_id = "36064187"
varied_camera_2_id = "31780776"

# Charuco Board Params #
CHARUCOBOARD_ROWCOUNT = 9
CHARUCOBOARD_COLCOUNT = 14
CHARUCOBOARD_CHECKER_SIZE = 0.020
CHARUCOBOARD_MARKER_SIZE = 0.016
ARUCO_DICT = aruco.Dictionary_get(aruco.DICT_5X5_100)

# Ubuntu Pro Token (RT PATCH) #
ubuntu_pro_token = "C149aq2yPpMR8WG4GS3vQguFgsoaaK"

# Code Version [DONT CHANGE] #
droid_version = "1.3"

