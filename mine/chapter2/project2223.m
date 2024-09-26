L = logm(TC)          % 求绕C点旋转2弧度的SE(2)的对数
S = skewa2vec(L)      % 将增广斜对称矩阵转换为向量，通过S这个有着3个元素的向量就能还原出整个包含旋转和位移数据的矩阵
expm(vec2skewa(S))    % 将向量还原成变换矩阵
X = vec2skewa([1 2 3])
skewa2vec(X)
T0 = trvec2tform([0 0]); % 设置参考坐标系
plottform2d(T0,frame="0",color="k");  
plottform2d(expm(X),frame="X",color="b");  % frame {X}