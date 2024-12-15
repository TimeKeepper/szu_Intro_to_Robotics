rpy0 = [-1 -1 0]; rpy1 = [1 1 0];
rpy = quinticpolytraj([rpy0' rpy1'],[0 1],linspace(0,1,50))
animtform(so3(eul2rotm(rpy')))
% 生成轨迹不经可以用于位置轨迹，还能作为角度轨迹
q0 = quaternion(eul2rotm(rpy0),"rotmat","point");
q1 = quaternion(eul2rotm(rpy1),"rotmat","point");
q = q0.slerp(q1,linspace(0,1,50));
% quaternion.slerp 也可以用于生成角度轨迹，但是会沿着great circle生成，能实现最短路径移动，地球上的飞机也喜欢沿着great circle飞行
whos q
animtform(q)
tpts = [0 5]; tvec = [0:0.01:5];
[q,w,a] = rottraj(q0,q1,tpts,tvec);
% rotraj(r0, rF, tInterval, tSamples) r0，rF是初始和终止姿态，tInterval是时间区间，tSamples是时间采样点
[s,sd,sdd] = minjerkpolytraj([0 1],tpts,numel(tvec));
[q,w,a] = rottraj(q0,q1,tpts,tvec,TimeScaling=[s;sd;sdd]);
