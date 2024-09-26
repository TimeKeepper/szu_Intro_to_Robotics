R = rotm2d(0.3) % 实例化一个旋转角度为0.3弧度的二维旋转矩阵
% rotm2d, 输入参数为旋转角度（弧度制），返沪一个二维旋转矩阵
plottform2d(R)  % 可视化
% plottform2d, 输入参数为转换矩阵，绘制二维平面上转换后的坐标系
det(R)          % 计算旋转矩阵的行列式
% det, 计算矩阵的行列式
det(R*R)        % 计算旋转矩阵平方的行列式

syms theta real
% syms, 定义符号
R = rotm2d(theta)
simplify(R * R)
% simplify, 简化表达式
ans = det(R)
simplify(ans)   % 这意味旋转对象并不会改变对象的空间尺寸
% 证明旋转矩阵的行列式恒为一