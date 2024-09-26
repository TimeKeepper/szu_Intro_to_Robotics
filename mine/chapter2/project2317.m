q = quaternion(rotmx(0.3),"rotmat","point") % 将一个旋转矩阵转换为四元数
q = q*q;
q.conj % 求共轭数
q*q.conj() % 四元数与自身共轭乘积相当于没有旋转，因此将得到一个无旋转矩阵对应的四元数
% quaternion.conj 能够求四元数的共轭数
q.rotmat("point") % 将四元数重新转换为旋转矩阵
% quaternion.rotatepoint 能够根据四元数生成旋转矩阵，若转换类型为point则根据点生成旋转矩阵，如果为frame则根据坐标轴生成旋转矩阵
q.compact() % 将四元数转换为N * 4的矩阵
% quaternion.compact 能够将四元数转换为N * 4的矩阵
q.rotatepoint([0 1 0]) % 对点(0, 1, 0)进行该四元数代表的旋转并输出旋转后的坐标
% quaternion.rotatepoint 能够根据输入的点进行四元数对应的旋转并输出旋转后的坐标