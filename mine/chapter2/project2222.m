clf; axis([-5 4 -1 5]); % 清除显示并设置坐标轴范围
T0 = trvec2tform([0 0]); % 设置参考坐标系
plottform2d(T0,frame="0",color="k");  
TX = trvec2tform([2 3]); % 设置坐标系，基于参考系平移至[2, 3]
plottform2d(TX,frame="X",color="b");  % frame {X}
TR = tformr2d(2);        % 设置旋转矩阵，绕原点逆时针旋转2弧度
plottform2d(TR*TX,frame="RX",color="g"); % 显示，先平移，再旋转
plottform2d(TX*TR,frame="XR",color="g"); % 显示，先旋转，再平移
C = [3 2];
plotpoint(C,"ko",label="C");
TC = trvec2tform(C)*TR*trvec2tform(-C) 
plottform2d(TC*TX,framelabel="XC",color="r"); % 令X绕C点旋转