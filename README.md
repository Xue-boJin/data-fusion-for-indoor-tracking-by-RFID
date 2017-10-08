# Kalman 滤波器
本节讲Kaman滤波器的原理及应用，它是基于多传感器跟踪方法的基础。

它只有五个公式，但有人觉着它很难，因为这五个公式的关系挺复杂的。

我们这里不讲Kalman滤波器是怎么来的，它为什么在参数已知的条件下是最有的等，我们只讲怎么用，具体来讲，我们准备讲明白以下几点：

1. 这五个公式啥关系？

2. 给你Matlab程序，来加深一下印象。

3. Kalman滤波器在使用时的一些小技巧。

### 1. 这五个公式啥关系？
![Kalman滤波器](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/KalmanFiler.png)

Kalman滤波器5个公式的关系
### 2. 给你Matlab程序，来加深一下印象。
    
    function [xe,pk,p1]=kalmanfun(A,C,Q,R,xe,z,p)
    %This function is to calculate the estimation state by Kalman filter.
    xe=A*xe;                     % 计算向前一步预测估计
    P1=A*p*A'+Q;                 % 计算向前一步估计方差
    K=p1*C'*inv(C*p1*C'+R);      % 计算估计增益
    xe=xe+K*(z-C*xe);            % 计算估计结果
    pk=(eye(size(p1))-l*C)*p1;   % 计算估计方差

### 3. Kalman滤波器在使用时的一些小技巧。
#### 稳态Kalman滤波器是啥？有什么用？
#### 估计的方差说明什么？方差越大说明什么？
参考文献

[1] 金学波，![Kalman滤波器理论与应用——基于MATLAB实现](http://www.ecsponline.com/goods.php?id=177510)，科学出版社，2016，第3章、第4章
