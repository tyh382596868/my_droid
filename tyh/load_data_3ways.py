


trajectory_folderpath = "/app/aaa/data/raw_data/all_data/put_the_blue_cube_in_the_red_cup/success/2026-03-02/Mon_Mar__2_16:11:33_2026"
h5_filepath = trajectory_folderpath + "/trajectory.h5"

# Prepare Trajectory Reader #
traj_reader = TrajectoryReader(filepath, read_images=False)
horizon = traj_reader.length()

# ================= 新增：初始化用于保存 action 的列表 =================
saved_actions = []

for i in range(horizon):
    # Get HDF5 Data #
    timestep = traj_reader.read_timestep()
    # breakpoint()
    # Move To Initial Position #
    if i == 0:
        init_joint_position = timestep["observation"]["robot_state"]["joint_positions"]
        init_gripper_position = timestep["observation"]["robot_state"]["gripper_position"]
        action = np.concatenate([init_joint_position, [init_gripper_position]])
        print(action)
        # env.update_robot(action, action_space="joint_position", blocking=True)
        # breakpoint()

    # Regularize Control Frequency #
    # time.sleep(1 / env.control_hz)

    # Get Action In Desired Action Space #
    arm_action = timestep["action"][env.action_space]
    gripper_action = timestep["action"][gripper_key]
    action = np.concatenate([arm_action, [gripper_action]])
    controller_info = timestep["observation"]["controller_info"]
    movement_enabled = controller_info.get("movement_enabled", True)
    
    if "velocity" in env.action_space:
        # clip all dimensions of action to [-1, 1]
        action = np.clip(action, -1, 1)        
        
    # ================= 新增：将 numpy array 转为 list 并追加到保存列表中 =================
    saved_actions.append(action.tolist())
    
    # Follow Trajectory #
    # print(f"Step {i}: {action}")
    if movement_enabled:
        saved_actions.append(action.tolist())