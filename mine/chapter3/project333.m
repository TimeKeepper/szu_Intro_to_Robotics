cornerPoints = [-1 1; 1 1; 1 -1; -1 -1; -1 1];
R = so2(rotm2d(deg2rad(30)));
% so2能够根据输入的旋转矩阵生成一个so2
via = R.transform(cornerPoints)';
% 利用so2的transform函数将四个角点转换到新的坐标系下
[q,qd,qdd,t] = trapveltraj(via,100,EndTime=5);
% 将四个角点作为路径点生成轨迹
plot(q(1,:),q(2,:),"b.-")
plot(q(1,:)) % 打印x坐标的轨迹
q2 = trapveltraj(via,100,EndTime=5,AccelTime=0.5);
plot(q2(1,:),q2(2,:),"r.-")
plot(q2(1,:))
% 通过规定AccelTime，在通过点的时候将不会减速
[q,qd,qdd] = minjerkpolytraj(via,[1 2 3 4 5],500);
% minjerkpolytraj函数生成加速度最小的轨迹，这样机器人运动起来会更加平滑且稳定
plot(q(1,:),q(2,:),".-")
vel_lim = [-1 1; -1 1]; accel_lim= [-2 2; -2 2];
[q,qd,qdd] = contopptraj(via,vel_lim,accel_lim,numsamples=100);
% contopptraj函数生成速度和加速度限制的轨迹
plot(q(1,:),q(2,:),".-")