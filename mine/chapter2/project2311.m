R = rotmx(pi/2) % 创建一个三维的旋转矩阵, 绕x轴旋转pi/2、
% rotmx 创建一个绕x轴旋转的三维旋转矩阵，参数为旋转角，与之对应的还有rotmy, rotmz
clf; plottform(R);
clf; plottform(R,anaglyph="rc", axis=[-2 2 -2 2 -2 2])
clf; animtform(R,anaglyph="rc", axis=[-2 2 -2 2 -2 2]);
R = rotmx(pi/2)*rotmy(pi/2) % 绕x轴旋转pi/2再绕y轴旋转pi/2
rotmy(pi/2)*rotmx(pi/2)