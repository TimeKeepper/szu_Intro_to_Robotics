% 实验的目的是使用扩展卡尔曼滤波器（EKF）进行状态估计。EKF 是一种用于非线性系统的递归估计方法，
% 通过线性化非线性系统模型来估计系统状态。实验将展示如何应用 EKF 来处理实际数据，并评估其性能。

rng(0) % 设置随机数种子以获得可重复的结果
map = LandmarkMap(20,10); % 创建一个包含20个地标的地图，地图尺寸为10x10
V = diag([0.1 deg2rad(1)].^2); % 设置机器人运动噪声协方差矩阵
robot = BicycleVehicle(covar=V, q0=[3 6 deg2rad(-45)]); % 创建一个自行车模型的机器人，初始状态为(3, 6, -45度)
robot.addDriver(RandomDriver(map.dim)); % 为机器人添加一个随机驾驶员，使其在地图内随机移动
W = diag([0.1 deg2rad(1)].^2); % 设置传感器噪声协方差矩阵
sensor = LandmarkSensor(robot,map,covar=W); % 创建一个地标传感器，附加到机器人上
P0 = diag([0.05 0.05 deg2rad(0.5)].^2); % 设置初始状态协方差矩阵
ekf = EKF(robot,V,P0,sensor,W,[]); % 创建扩展卡尔曼滤波器对象
ekf.run(500,x_est0=[0 0 0]); % 运行EKF，进行500次迭代，初始估计状态为(0, 0, 0)
map.plot; % 绘制真实地图
robot.plotxy("b"); % 绘制机器人的真实路径，使用蓝色
ekf.plotmap("g"); % 绘制估计的地标位置及其协方差，使用绿色
ekf.plotxy("r"); % 绘制估计的机器人路径，使用红色
T = ekf.transform(map); % 计算从地图到估计地图的变换