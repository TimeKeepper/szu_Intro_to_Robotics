T0 = se3(eul2rotm([1.5 0 0]),[0.4 0.2 0]);
T1 = se3(eul2rotm([-pi/2 0 -pi/2]),[-0.4 -0.2 0.3]);
T0.interp(T1,0.5)
% ubrerp能够生成两个se3的中间值，权重为0到1的线性插值
tpts = [0 1]; tvec = linspace(tpts(1),tpts(2),50);
Ts = transformtraj(T0,T1,tpts,tvec);
whos Ts
% 生成轨迹
animtform(Ts)
Ts(251)
% 轨迹的中间值
P = Ts.trvec();
% 获取平移分量
size(P)
plot(P);
plot(rotm2eul(Ts.rotm()));
Ts = transformtraj(T0,T1,tpts,trapveltraj(tpts,50));
% 生成梯形速度轨迹