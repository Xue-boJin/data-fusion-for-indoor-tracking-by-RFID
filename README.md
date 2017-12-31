# 第7次课 非线性估计

## EKF

EKF使用泰勒级数展开的方法，将非线性关系变成了线性关系。当然啦，只取了1阶变换，因此，可以知道，如果非线性特别严重的话，1阶近似就不太好啦！！

![EKF算法](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/EKFpng.png)

## UKF

UKF使用一种叫“不敏变换”（Sigma Transform）将非线性的点“爆炸”成若干个点，就是这样的：![不敏变换](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/UKF0.png)。

请看下面的不敏变换后的示意图 ![不敏变换的示意图](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/UKFFigure.png)

然后每一步都是这多个点进行估计，再计算方差，这可是复杂多了！！

![UKF](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/UKF1.png)
![UKF](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/UKF2.png)

# 第8次课 RFID室内跟踪系统
## 系统特点
1. 采样时间是事件驱动式，时间间隔不等，也就是采样周期不再是T。
2. 测量传感器的模型是非线性的，需要使用非线性估计方法。
3. 目标的运动很复杂，不再满足恒速、恒加速等情况，所以需要使用能够描述复杂运动关系的运动模型。

##解决方案


参考文献

[1] 金学波，![Kalman滤波器理论与应用——基于MATLAB实现](http://www.ecsponline.com/goods.php?id=177510)，科学出版社，2016，第5章、第8章
