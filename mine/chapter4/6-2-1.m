% 该实验的目的是使用扩展卡尔曼滤波器（EKF）结合地标传感器来估计带有噪声协方差的自行车模型（BicycleVehicle）的状态。
% 实验通过设置随机数生成器以确保结果可重复，演示了EKF在机器人运动过程中的状态估计、
% 地标传感器的读数、协方差矩阵的演变以及状态估计的不确定性。

rng(0) % 设置随机数生成器以确保结果可重复
map = LandmarkMap(20,10); % 创建一个包含20个地标的地图，地图尺寸为10x10
map.plot; % 绘制地图
W = diag([0.1 deg2rad(1)].^2); % 定义地标传感器的噪声协方差矩阵
sensor = LandmarkSensor(robot,map,covar=W, ... % 创建地标传感器，测量范围为10，角度范围为[-pi/2, pi/2]
    range=10,angle=[-pi/2 pi/2]);
[z,i] = sensor.reading; % 获取传感器读数
map.landmark(14); % 获取地图中第14个地标的位置
rng(0) % 重新设置随机数生成器以确保结果可重复
map = LandmarkMap(20,10); % 重新创建地图
V = diag([0.02 deg2rad(0.5)].^2); % 定义自行车模型的过程噪声协方差矩阵
robot = BicycleVehicle(Covariance=V); % 创建带有噪声协方差的自行车模型
robot.addDriver(RandomDriver(map.dim,show=true)); % 为自行车模型添加随机驾驶员
sensor = LandmarkSensor(robot,map,covar=W, ... % 创建地标传感器，测量范围为4，角度范围为[-pi/2, pi/2]，并启用动画
    range=4,angle=[-pi/2 pi/2],animate=true);
P0 = diag([0.05 0.05 deg2rad(0.5)].^2); % 定义初始状态协方差矩阵
ekf = EKF(robot,V,P0,sensor,W,map); % 创建扩展卡尔曼滤波器对象
ekf.run(400); % 运行扩展卡尔曼滤波器400次迭代
clf; % 清除当前图形窗口
map.plot; % 绘制地图
robot.plotxy("b"); % 绘制自行车模型的轨迹，颜色为蓝色
ekf.plotxy("r"); % 绘制EKF估计的轨迹，颜色为红色
ekf.plotellipse(fillcolor="g",alpha=0.3); % 绘制EKF估计的不确定性椭圆，填充颜色为绿色，透明度为0.3