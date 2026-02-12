import sys
import os
import time
import signal
import pyzed.sl as sl

# 全局退出标志
EXIT_SIGNAL = False

def signal_handler(signum, frame):
    global EXIT_SIGNAL
    print(f"\n[!] 接收到信号 {signum}，准备停止...")
    EXIT_SIGNAL = True

def main():
    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    print("[*] 初始化相机 (SVO v1 模式)...")
    cam = sl.Camera()
    init_params = sl.InitParameters()
    init_params.camera_resolution = sl.RESOLUTION.HD720
    init_params.camera_fps = 60
    
    status = cam.open(init_params)
    if status != sl.ERROR_CODE.SUCCESS:
        print(f"[!] 打开相机失败: {status}")
        return

    # === 关键修改 ===
    # 强制使用 .svo 扩展名 (旧版格式)
    output_path = "legacy_recording.svo" 
    
    # 使用 H264 (通常比 H265/LOSSLESS 更稳定)
    compression = sl.SVO_COMPRESSION_MODE.H264
    
    rec_params = sl.RecordingParameters(output_path, compression)
    # 显式指定使用旧版 SVO 容器格式 (避免使用 SVO2)
    # 注意：如果你的 SDK 版本较老没有这个属性，通常只要文件名后缀是 .svo 就会自动切换
    try:
        rec_params.svo_file_format = sl.SVO_FILE_FORMAT.SVO
    except AttributeError:
        print("[*] SDK版本较旧，默认使用 SVO v1")

    err = cam.enable_recording(rec_params)
    if err != sl.ERROR_CODE.SUCCESS:
        print(f"[!] 无法启动录制: {err}")
        cam.close()
        return

    print(f"[*] 开始录制到 {output_path}")
    print("[*] 请运行 5 秒钟，然后按一次 Ctrl+C")

    runtime = sl.RuntimeParameters()
    frames = 0
    
    try:
        while not EXIT_SIGNAL:
            err = cam.grab(runtime)
            if err == sl.ERROR_CODE.SUCCESS:
                # 稍微让出一点 CPU，防止 IO 线程饿死
                frames += 1
                if frames % 30 == 0:
                    print(f"Recording... {frames} frames", end="\r")
            else:
                time.sleep(0.001)

    except Exception as e:
        print(f"Error: {e}")
        
    finally:
        print("\n\n[*] 正在写入文件索引 (请勿强制退出)...")
        cam.disable_recording()
        # 增加系统同步，确保 Docker 将数据刷入磁盘
        try:
            os.sync() 
        except:
            pass
        time.sleep(2) # 给 SDK 内部线程多一点时间
        cam.close()
        print("[*] 完成。")
        
        # 检查文件
        if os.path.exists(output_path):
            size_mb = os.path.getsize(output_path) / (1024*1024)
            print(f"[*] 生成文件: {output_path} ({size_mb:.2f} MB)")
        else:
            print("[!] 文件未生成")

if __name__ == "__main__":
    main()