#!/bin/bash
set -e

# 配置版本变量
UBUNTU_RELEASE_YEAR=22
ZED_SDK_MAJOR=4
ZED_SDK_MINOR=0
CUDA_MAJOR=12
CUDA_MINOR=1

echo "正在安装依赖项..."
sudo apt-get update -y
sudo apt-get install --no-install-recommends \
    lsb-release wget less udev sudo zstd build-essential \
    cmake python3 python3-pip libpng-dev libgomp1 -y

# python3 -m pip install numpy opencv-python


FILENAME="ZED_SDK_Ubuntu22_cuda12.1_v4.0.8.zstd.run"

chmod +x $FILENAME

echo "正在安装 ZED SDK (包含 Tools 和 CUDA)..."
# 移除 skip_tools 和 skip_cuda
# 注意：在脚本中手动安装时，如果不加 --silent，安装程序会弹出 EULA 协议
./$FILENAME -- silent skip_cuda

# 设置符号链接
sudo ln -sf /lib/x86_64-linux-gnu/libusb-1.0.so.0 /usr/lib/x86_64-linux-gnu/libusb-1.0.so

# 清理
# rm $FILENAME
echo "安装完成！"