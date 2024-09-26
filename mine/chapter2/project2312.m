R = rotmz(0.1)*rotmy(-0.2)*rotmz(0.3)
R = eul2rotm([0.1 -0.2 0.3],"ZYZ") % 将欧拉角转换为旋转矩阵
% eiu2rotm能将欧拉角转换为旋转矩阵，第一个参数是旋转角向量，第二个参数是旋转轴
gamma = rotm2eul(R,"ZYZ")
% rotm2eul能将旋转矩阵转换成欧拉角，第一个参数是旋转矩阵，第二个参数是旋转轴
R = eul2rotm([0.1 0.2 0.3],"ZYZ")
gamma = rotm2eul(R,"ZYZ")
eul2rotm(gamma,"ZYZ")
R = eul2rotm([0.1 0 0.3],"ZYZ")
rotm2eul(R,"ZYZ")
R = eul2rotm([0.3 0.2 0.1],"ZYX")
gamma = rotm2eul(R,"ZYX")
R = eul2rotm([0.3 0.2 0.1],"XYZ")
gamma = rotm2eul(R,"XYZ")
tripleangleApp