R = rotmx(0.3)
L = logm(R)
S = skew2vec(L) % 转换为旋转向量
expm(L)
expm(vec2skew(S))
R = rotmx(0.3);
R = expm(0.3*vec2skew([1 0 0]))
R = expm(vec2skew([0.3 0 0]))
% 通过三个数字就可以直接生成旋转矩阵
X = vec2skew([1 2 3])
skew2vec(X)