% 该实验的目的是使用扩展卡尔曼滤波器（EKF）结合地标传感器来估计带有噪声协方差的自行车模型（BicycleVehicle）的状态。
% 实验通过设置随机数生成器以确保结果可重复，演示了EKF在机器人运动过程中的状态估计、
% 地标传感器的读数、协方差矩阵的演变以及状态估计的不确定性。

rng(0) % 设置随机数生成器以获得可重复的结果
map = LandmarkMap(20,10); % 创建一个包含20个地标的地图，地图尺寸为10x10
robot = BicycleVehicle; % 创建一个无误差的自行车模型
robot.addDriver(RandomDriver(map.dim)); % 为自行车模型添加一个随机驾驶员
W = diag([0.1 deg2rad(1)].^2); % 定义过程噪声协方差矩阵
sensor = LandmarkSensor(robot,map,covar=W); % 创建一个地标传感器，使用定义的噪声协方差矩阵
ekf = EKF(robot,[],[],sensor,W,[]); % 创建扩展卡尔曼滤波器对象
ekf.run(1000); % 运行EKF 1000次迭代
map.plot; % 绘制地图
ekf.plotmap("g"); % 绘制EKF估计的地标位置，使用绿色标记
robot.plotxy("b"); % 绘制自行车模型的轨迹，使用蓝色标记
ekf.landmarks(:,17)'  % 转置以显示第17个地标的位置
ekf.x_est(1:2)'  % 转置以显示状态估计的前两个元素
ekf.P_est(1:2,1:2) % 显示状态估计协方差矩阵的前2x2子矩阵