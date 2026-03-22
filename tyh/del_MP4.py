import os
import shutil

# 根目录，根据你的情况修改
root_dir = "/app/data/success"

# 遍历目录树
for dirpath, dirnames, filenames in os.walk(root_dir, topdown=True):
    # 找到名为 "MP4" 的文件夹
    if "MP4" in dirnames:
        mp4_path = os.path.join(dirpath, "MP4")
        print(f"正在删除: {mp4_path}")
        shutil.rmtree(mp4_path)  # 删除整个文件夹及其内容
        # 从 dirnames 中移除，避免继续遍历已删除的目录
        dirnames.remove("MP4")
