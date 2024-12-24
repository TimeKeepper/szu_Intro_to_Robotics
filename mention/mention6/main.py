# 读取一个彩色图像A
# 初始化一个全零数组B，大小与A相同
# 给定一个整数N和方差上线T=50 对于i从1到N在B中添加一个高斯函数...,其中x_i,y_i，sigmai,alphai为待优化参数，搜索这几个参数，其中方差<T，使得B与A的MSE误差减少
# 显示不同N得到的B，并绘制出MSE随着N增加而减少的曲线
import numpy as np
import cv2
import matplotlib.pyplot as plt
from scipy.optimize import minimize

# 读取图像A
A = cv2.imread('image.jpg')  # 需要替换为实际图像路径
A = cv2.cvtColor(A, cv2.COLOR_BGR2RGB)  # 转换为RGB模式

# 初始化B，大小与A相同
B_shape = A.shape
B = np.zeros_like(A, dtype=np.float32)

# 高斯函数生成的代码
def gaussian(x, y, sigma, alpha, B_shape):
    X, Y = np.meshgrid(np.arange(B_shape[1]), np.arange(B_shape[0]))
    return alpha * np.exp(-((X - x)**2 + (Y - y)**2) / (2 * sigma**2))

# 计算MSE
def calculate_mse(B, A):
    return np.mean((B - A) ** 2)

# 参数优化目标函数：最小化MSE
def objective(params, N, B_shape, A):
    B = np.zeros_like(A, dtype=np.float32)
    
    for i in range(N):
        x, y, sigma, alpha = params[i*4:(i+1)*4]
        # 生成高斯图像
        gaussian_image = gaussian(x, y, sigma, alpha, B_shape)
        # 将高斯图像复制到RGB通道
        gaussian_image_rgb = np.stack([gaussian_image] * 3, axis=-1)
        B += gaussian_image_rgb
    
    mse = calculate_mse(B, A)
    return mse

# 参数初始化
N = 20  # 初始化N值
params_initial = np.random.rand(N * 4)  # 随机初始化4个参数（x, y, sigma, alpha）

# 参数优化
result = minimize(objective, params_initial, args=(N, B_shape, A), bounds=[(0, B_shape[1]-1), (0, B_shape[0]-1), (0, 50), (0, 255)]*N, method='L-BFGS-B')

# 获取优化后的参数
params_optimized = result.x

# 更新B
B_optimized = np.zeros_like(A, dtype=np.float32)
for i in range(N):
    x, y, sigma, alpha = params_optimized[i*4:(i+1)*4]
    gaussian_image = gaussian(x, y, sigma, alpha, B_shape)
    gaussian_image_rgb = np.expand_dims(gaussian_image, axis=-1).repeat(3, axis=-1)  # 将二维数组扩展为三维数组
    B_optimized += gaussian_image_rgb

# 显示结果
plt.figure(figsize=(12, 6))

# 显示B图像
plt.subplot(1, 2, 1)
plt.imshow(B_optimized.astype(np.uint8))
plt.title(f'Optimized B with N={N}')

# 计算不同N值的MSE曲线
mse_values = []
N_values = range(1, 21)  # N从1到20
for n in N_values:
    result = minimize(objective, np.random.rand(n * 4), args=(n, B_shape, A), bounds=[(0, B_shape[1]-1), (0, B_shape[0]-1), (0, 50), (0, 255)]*n, method='L-BFGS-B')
    mse_values.append(result.fun)

# 绘制MSE曲线
plt.subplot(1, 2, 2)
plt.plot(N_values, mse_values, marker='o')
plt.title('MSE vs N')
plt.xlabel('N (Number of Gaussians)')
plt.ylabel('MSE')

plt.tight_layout()
plt.show()
