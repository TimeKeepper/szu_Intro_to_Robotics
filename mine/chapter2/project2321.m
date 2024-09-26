T = trvec2tform([2 0 0])*tformrx(pi/2)*trvec2tform([0 1 0])
% 创建一个SE(3)矩阵，同时包含旋转和平移的信息
clf; plottform(T);
tform2rotm(T) % 提取旋转部分
% tform2rotm 可以将转换矩阵中的旋转矩阵提取出来
tform2trvec(T) % 提取平移部分
% tform2trvec 可以将转换矩阵中的平移向量提取出来