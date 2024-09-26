# 关于对矩阵求对数的理解

> 对数运算是指数运算的逆运算，为了理解矩阵对数的定义，我们需要引入矩阵的指数运算。
> 矩阵的指数运算是为了针对特殊微分方程定义的，这类微分方程通常符合如下形式：
>> $$
>> \frac{d}{dt}
>> \begin{bmatrix}
>> x(t) \\
>> y(t)
>> \end{bmatrix}
>> =
>> \begin{bmatrix}
>> A
>> \end{bmatrix}
>> \begin{bmatrix}
>> x(t) \\
>> y(t)
>> \end{bmatrix}
>> $$
> 即：其变化率等于矩阵A乘以当前状态向量。\
> 那么可推导得 
>> $$
>> \begin{bmatrix}
>> x(t) \\
>> y(t)
>> \end{bmatrix}
>> = e^{
>> \begin{bmatrix}
>> A
>> \end{bmatrix}
>> }
>> t + 
>> \begin{bmatrix}
>> x(0) \\
>> y(0)
>> \end{bmatrix}
>> $$
> 特别的，若A为逆时针90度旋转矩阵rotm2d(pi/2)，且x(0)=y(0)=0，有：
> $$
> \begin{bmatrix}
> x(t) \\
> y(t)
> \end{bmatrix} = e^{
> \begin{bmatrix}
> 0 & -1 \\
> 1 & 0
> \end{bmatrix}
> t
> }
> $$
> 将其泰勒展开可得：
> $$
> e^{
> \begin{bmatrix}
> 0 & -1 \\
> 1 & 0
> \end{bmatrix}
> t
> }
> = 
> \begin{bmatrix}
> cos(t) & -sin(t) \\
> sin(t) & cos(t)
> \end{bmatrix}
> $$
> 对两边求对数有:
> $$
> \ln(
> \begin{bmatrix}
> cos(t) & -sin(t) \\
> sin(t) & cos(t)
> \end{bmatrix}
> )
> = 
> \begin{bmatrix}
> 0 & -1 \\
> 1 & 0
> \end{bmatrix}
> t
> $$