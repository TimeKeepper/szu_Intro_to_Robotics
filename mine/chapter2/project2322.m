T = trvec2tform([2 3 4])*tformrx(0.3) % 创建一个变换矩阵
L = logm(T) % 求对数
S = skewa2vec(L) % 转为向量形式
expm(vec2skewa(S)) % 通过向量重建变换矩阵
X = vec2skewa([1 2 3 4 5 6]) % 构造变换矩阵的对数值
skewa2vec(X) % 转换为向量形式