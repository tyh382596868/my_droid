# Read the parameter values from the Python script using awk and convert to env variables
echo -e "\nSet environment variables from parameters file\n"

PARAMETERS_FILE="$(git rev-parse --show-toplevel)/droid/misc/parameters.py"
awk -F'[[:space:]]*=[[:space:]]*' '/^[[:space:]]*([[:alnum:]_]+)[[:space:]]*=/ && $1 != "ARUCO_DICT" { gsub("\"", "", $2); print "export " $1 "=" $2 }' "$PARAMETERS_FILE" > temp_env_vars.sh
source temp_env_vars.sh
export ROOT_DIR=$(git rev-parse --show-toplevel)
export NUC_IP=$nuc_ip
export ROBOT_IP=$robot_ip
export LAPTOP_IP=$laptop_ip
export SUDO_PASSWORD=$sudo_password
export ROBOT_TYPE=$robot_type
export ROBOT_SERIAL_NUMBER=$robot_serial_number
export HAND_CAMERA_ID=$hand_camera_id
export VARIED_CAMERA_1_ID=$varied_camera_1_id
export VARIED_CAMERA_2_ID=$varied_camera_2_id
export UBUNTU_PRO_TOKEN=$ubuntu_pro_token
rm temp_env_vars.sh

if [ "$ROBOT_TYPE" == "panda" ]; then
        export LIBFRANKA_VERSION=0.9.0
else
        export LIBFRANKA_VERSION=0.15.0
fi

# build control server container 

# path variables
ROOT_DIR="$(git rev-parse --show-toplevel)"
DOCKER_COMPOSE_DIR="$ROOT_DIR/.docker/laptop"
DOCKER_COMPOSE_FILE="$DOCKER_COMPOSE_DIR/docker-compose-laptop.yaml"


# ensure GUI window is accessible from container
echo -e "Set Docker Xauth for x11 forwarding \n"

export DOCKER_XAUTH=/tmp/.docker.xauth
rm $DOCKER_XAUTH
touch $DOCKER_XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $DOCKER_XAUTH nmerge -

export DISPLAY=:0  # 根据你的环境，0 可能需要改为其他值


cd $DOCKER_COMPOSE_DIR 

#docker compose -f docker-compose-laptop.yaml run --rm laptop_setup python scripts/test/collect_trajectory.py
# docker compose -f docker-compose-laptop.yaml run --rm laptop_setup bash

docker compose -f docker-compose-laptop.yaml run --rm -it \
  --volume /run/udev:/run/udev \
  laptop_setup bash


#
#docker compose -f docker-compose-laptop.yaml run laptop_setup python app/scripts/test/collect_trajectory.py



