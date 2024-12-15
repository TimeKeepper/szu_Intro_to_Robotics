q0 = [0 2]; qf = [1 -1];
q = trapveltraj([q0' qf'],50,EndTime=1);
% trapveltraj不仅能接受一个位置向量，这样调用这个方法就能够同时生成两个对象的轨迹
plot(q')