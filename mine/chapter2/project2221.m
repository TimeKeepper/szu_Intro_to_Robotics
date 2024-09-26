rotm2d(0.3)
tformr2d(0.3) % 该函数创建一个纯旋转无平移的SE(2)
% tformr2d 创建一个无位移的SE变换矩阵，参数为弧度制的旋转角
TA = trvec2tform([1 2])*tformr2d(deg2rad(30)) % 将一个平移向量转换为SE(2)再乘上一个纯旋转的SE(2)
% trvec2tform将一个平移向量转换为无旋转的SE变换矩阵
clf; axis([0 5 0 5]); hold on % new plot with both axes from 0 to 5
% axis 设置坐标轴范围
plottform2d(TA,frame="A",color="b");
T0 = trvec2tform([0 0]);
plottform2d(T0, frame="0",color="k");  % reference frame
TB = trvec2tform([2 1])
plottform2d(TB,frame="B",color="r");
TAB = TA*TB
plottform2d(TAB,frame="AB",color="g");
TBA = TB*TA;
plottform2d(TBA,frame="BA",color="c"); % 显然先旋转再平移和先平移再旋转得到的结果是不同的，这在另一个层面上证明了矩阵乘法不满足交换律。
P = [3;2];  % column vector
plotpoint(P',"ko",label="P");