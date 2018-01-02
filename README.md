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

请参见关于本部分内容的![简要介绍](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/7%20%E9%9D%9E%E7%BA%BF%E6%80%A7Kalman%E6%BB%A4%E6%B3%A2%E5%99%A8.pdf)及![扩展阅读](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/nonlinear%20Kalman%20filter.pdf)。

相关的程序我们在下一节“RFID室内跟踪系统”再看。

# 第8次课 RFID室内跟踪系统
## 系统特点
1. 采样时间是事件驱动式，时间间隔不等，也就是采样周期不再是T。
2. 测量传感器的模型是非线性的，需要使用非线性估计方法。
3. 目标的运动很复杂，不再满足恒速、恒加速等情况，所以需要使用能够描述复杂运动关系的运动模型。

## 基于可变数量RFID阅读器的EKF跟踪方法

在实际应用中，该系统包括预测、状态估计和参数估计三个部分。

![EKF跟踪算法](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/RFID%20EKF.png)

为了更好的理解算法，我们来一起看一下程序吧！

这是一个函数 ![程序funDataDrivenModelYWwithEKF](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/funDataDrivenModelYWwithEKF.m)，还调用了一个![子函数myEKFadfun](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/myEKFadfun.m)。

## 基于可变数量RFID阅读器的UKF跟踪方法

在实际应用中，该系统包括sigma变换、预测、状态估计和参数估计三个部分。

![UKF跟踪算法](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/RFID%20UKF.png)

为了更好的理解算法，我们来一起看一下程序吧！

这也是一个函数 ![程序funDataDrivenModelYWnonparell](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/funDataDrivenModelYWnonparell.m)，还调用了一个![子函数myUKFadfun](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/myUKFadfun.m)。

## 仿真研究

大家需要下载1[仿真程序C8_1.m](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/C8_1.m)，运行之后可以看到一下结果。

这个程序需要下载 ![数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/RFIDm5.mat)，当然还需要上面提到的EKF或UKF函数，所以需要下载文件夹lesson3下的所有程序。

### EKF

横、纵轴的估计协方差分别为49.2714 、38.524。

![结果图](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/EKF%E4%BB%BF%E7%9C%9F%E7%BB%93%E6%9E%9C%E5%9B%BE.png)


### UKF

横、纵轴的估计协方差分别为43.7320、30.1378。

![结果图](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/UKF%E4%BB%BF%E7%9C%9F%E7%BB%93%E6%9E%9C%E5%9B%BE.png)

请参见关于本部分内容的![简要介绍](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/8%20RFID%E8%B7%9F%E8%B8%AA%E7%B3%BB%E7%BB%9F.pdf)及![扩展阅读](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson3/8%20RFID%20%E8%B7%9F%E8%B8%AA%E7%B3%BB%E7%BB%9F%E6%89%A9%E5%B1%95%E9%98%85%E8%AF%BB.pdf)。

参考文献

[1] 金学波，![Kalman滤波器理论与应用——基于MATLAB实现](http://www.ecsponline.com/goods.php?id=177510)，科学出版社，2016，第5章、第8章
