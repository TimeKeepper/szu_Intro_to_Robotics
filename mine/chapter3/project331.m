clf;t = linspace(0,1,50); % 0 to 1 in 50 steps
% linespace(x1, x2, n) 生成包含x1和x2的n个等间距的行向量
[q,qd,qdd] = quinticpolytraj([0 1],[0 1],t);
% quinticpolytraj(x1, x2, t） 生成五次多项式轨迹, 其中x1表示轨迹的位置移动向量，x2表示轨迹的时间移动向量，t表示时间序列，返回值为位置、速度和加速度对时间的序列
% stackedplot(x,y) 绘制堆叠图
[q2,qd2,qdd2] = quinticpolytraj([0 1],[0 1],t, ...
  VelocityBoundaryCondition=[10 0]); % 位置和时间向量不变，但同时规定速度向量为[10, 0]
clf; stackedplot(t,[q' qd' qdd' q2' qd2' qdd2'])
% 若规定初始速度过大，则会导致轨迹发生“反弹”现象
mean(qd)/max(qd)
% mean(), 计算均值
% 结果表明，电机潜能之发挥了52%，没有全功率运行，以最快速度达到目标位置
[q,qd,qdd] = trapveltraj([0 1],50);
% trapveltraj(x, n) 生成一个速度为梯形，位置向量为x，时间序列个数为n的轨迹，返回值为位置、速度和加速度对时间的序列
stackedplot(t,[q' qd' qdd'])
max(qd) % 最大速度达到了1.5
mean(qd)/max(qd) % 电机潜能发挥了65%