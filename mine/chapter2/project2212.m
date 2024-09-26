R = rotm2d(0.3);
L = logm(R)    % 这个函数用于对旋转矩阵求对数，具体见project2212.md
S = skew2vec(L) % 将斜对称矩阵转换为向量
% 将斜对称旋转矩阵转换为旋转向量