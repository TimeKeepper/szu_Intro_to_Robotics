# 实现一个简单的感知机
# 构建输入数据（椭圆的长轴和短轴）和真实输出数据（长轴/短<2标记为True，否则标记为False）
# 随机生成初始权重参数
# 计算该参数下的输出（正向）
# 计算输出和真实之间的误差
# 更新参数（反向）
# 持续迭代直到系统收敛（绘制正确率和迭代次数的曲线，至少两个不同的学习率）

import torch
import numpy as np
import matplotlib.pyplot as plt

def train(lr = 0.1):
    # 构建输入数据
    data = np.random.rand(1000, 2)
    data = data * 2 - 1
    data = torch.tensor(data, dtype=torch.float32)

    # 构建真实输出数据
    label = data[:, 0] / data[:, 1] < 2
    label = label.float()

    # 初始化权重参数
    w = torch.randn(2, requires_grad=True)
    b = torch.randn(1, requires_grad=True)

    # 训练
    accs = []
    for epoch in range(100):
        # 计算输出
        output = torch.matmul(data, w) + b 
        output = torch.sigmoid(output)

        # 计算误差
        loss = torch.nn.functional.binary_cross_entropy(output, label)

        # 反向传播
        loss.backward()

        # 更新参数
        with torch.no_grad():
            w -= lr * w.grad
            b -= lr * b.grad

            w.grad.zero_()
            b.grad.zero_()

        # 计算正确率
        output = output > 0.5
        acc = (output == label).float().mean()
        accs.append(acc.item())

    return accs

if __name__ == '__main__':
    # 绘制正确率和迭代次数的曲线
    accs = train(0.01)
    plt.plot(accs)
    plt.xlabel('Epoch')
    plt.ylabel('Accuracy')
    plt.show()
