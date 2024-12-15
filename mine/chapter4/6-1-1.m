% 该实验的目的是模拟和分析一个带有噪声协方差的自行车模型（BicycleVehicle）的运动。
% 通过设置随机数生成器以确保结果可重复，实验演示了机器人在给定控制输入下的运动步骤、
% 状态更新以及在随机驾驶员控制下的运行情况。

close all      % 关闭所有图形窗口
clear          % 清除工作区中的所有变量
format compact % 紧凑打印输出
rng(0)         % 设置随机数生成器种子以确保结果可重复
V = diag([0.02 deg2rad(0.5)].^2); % 定义噪声协方差矩阵
robot = BicycleVehicle(Covariance=V) % 创建带有噪声协方差的自行车模型对象
rng(0) % 再次设置随机数生成器种子以确保结果可重复
odo = robot.step(1,0.3) % 机器人执行一步，控制输入为速度1和转向角0.3
robot.q % 获取机器人的当前状态
robot.f([0 0 0],odo) % 使用里程计数据更新机器人的状态
robot.addDriver(RandomDriver([-10 10 -10 10],show=true)) % 添加一个随机驾驶员，定义驾驶区域为[-10, 10] x [-10, 10]
robot.run(10); % 运行机器人10个时间步长