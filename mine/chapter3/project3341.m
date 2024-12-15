q1 = quaternion(rotmz(-2),"rotmat","point");
q2 = quaternion(rotmz(1),"rotmat","point");
animtform(q1.slerp(q2,linspace(0,1,50)))
q2 = quaternion(rotmz(2),"rotmat","point");
animtform(q1.slerp(q2,linspace(0,1,50)))
% 轨迹生成会沿着最短路径