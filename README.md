
# 第一次课的内容
开始啦！！ 
## 什么是信息融合
从广义上讲，多源信息融合无时不刻地存在于我们人类的生活、工作和学习当中，在战争中更是如此。战场上，指挥官都要融合各种各样的信息才能获得一场战争的胜利，从古代的战争到现在的战争都是如此。

信息融合的定义从广义上来讲是研究利用多个数据源更好地完成任务，这些任务包括在时间上和空间上能够更全面的利用数据信息，能够更高层次的归纳数据信息，获得我们想要知识，以达到我们的目的。多源信息融合系统有各种各样的数据，不同的数据可能会完成不同的任务。

从方法上来讲，我们通常把融合方式分为两类方法，一类是集中式的，一类是分布式的。因为传感器有各种各样不同的特点，融合各个传感器的优势来获得最终的一个更好的结果就显得非常必要了。

中医上讲的望、闻、问、切就是一个典型的信息融合过程，一个医生把病人的各种状况都采集下来，然后，有经验的老中医会把这些信息能够很好的融合在一起，给出更好的诊断结果。
## 信息融合技术简介
最早提出来信息融合技术的是美国军方提出来的。该定义是这样的：信息融合是对从单个和多个信息源获取的数据和信息进行关联相关和综合，以获得精确的位置和身份估计，以及对态势和威胁及其重要程度进行全面及时评估的信息。

信息融合技术从1973年年初提出来，以后经历了20世纪的80年代、90年代初和90年代末的三次研究热潮。从1973年美国国防部资助开发的声纳信号理解系统首次提出了数据融合的概念。1988年，美国国防部把数据融合列为90年代重点研究开发的20项关键技术之一。又过了三年之后，1991年美国就已经在这方面有了很多的研究成果，已经有54个融合系统引入到了军用电子系统中去。1995年，我国首次数据融合技术会议，有很多研究工作者，包括军方研究所和大学都有了很多这方面的研究。

## 大信息融合的概念与信息融合技术的关系
![两者的关系](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/ApplicationofFusion.png)
感觉到这两者不一样了吧！！希望课程能让你既可以应用信息融合的概念处理生活、学习中的事情，让自己更有智慧，又可以学会信息融合技术做一个IT精英！
## 本门课程的主要内容
以数据融合中的位置估计为主要内容，讲授基于RFID的室内跟踪仿真系统。

我们一起搭建一个基于MATLAB的仿真系统，界面就像这样的。。
![RFID仿真系统界面](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/RFIDTrackingSystem.png)
##  数据源的误差
接下来我们来谈一下传感器获得的数据源的问题。我们知道我们必须要通过一定的方式来采集多源信息融合。我们这门课程所研究的信息主要是来自于传感器，因此这一节我们先首先来讨论一下关于传感器的测量问题。

首先要说明的是传感器测量会有很大的不确定性，也就是说我们通过传感器获得的数据和真实的数据往往是有很大的偏差的。

那么这些传感器所获得的数据具有哪些不准确性呢？这些不准确性主要包括常值误差、漂移误差和测量噪声。常值误差指的是在测量的过程中，由于读数、或传感器本身的性能上存在的一个偏差，它会是一个常量，测量值始终是和真实值相差一个常量。 漂移误差是测量结果和真实值之间会产生一定的逐渐加大的偏差，有时是由于传感器的温度逐渐升高造成的。我们会发现这个偏差越来越大。

还有一种就是由于传感器本身的性能，以及周围的一些干扰，导致测量数据会含有噪声。传感器的这三种不同测量误差都需要我们消除或者了解。
![真实值和各种不确定性](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/MeasurementNoise.png)

真实值和各种不确定性，包括常值误差、漂移误差和测量噪声
![测量值](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/Measurement.png)

获得的测量值，它和真实值是多么的不一样呀！所以，有时传感器很不准，有木有？？

获得上述结果的见程序![含有测量偏差及噪声的测量数据模拟](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/MeasurementNoise.m)

通常情况下，我们的处理是将常值误差去掉获得更准确的值，这个过程我们一般把它叫做标定。漂移误差也要通过一定的标定的方式，比如说将传感器运行一段时间之后，然后获得这些漂移，再把它们从测量的数值中去掉。

对于测量噪声来讲，因为这是一个统计随机过程的统计量，所以说我们不能够把它去掉，但是我们需要知道这个噪声的统计特性，比如说它是否是高斯白噪声以及它的方差等等，利用这些信息在融合过程当中来考虑这些测量数据的不准确性，以获得更准确的融合结果。

### 练习
利用MATLAB实现以下问题。
![课堂练习——获得模拟的测量数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/ClassWork1forKalmanFilter.png)

# 第二次课的主要内容
## Kalman 滤波器
本节讲Kaman滤波器的原理及应用，它是基于多传感器跟踪方法的基础。

它只有五个公式，但有人觉着它很难，因为这五个公式的关系挺复杂的。

关于Kalman滤波器是怎么来的，为什么在参数已知的条件下是最优的等相关问题，请参见![扩展阅读1](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/5-%E7%AC%AC3%E7%AB%A0%20%E7%BA%BF%E6%80%A7%E6%9C%80%E5%B0%8F%E4%BA%8C%E4%B9%98%E4%BC%B0%E8%AE%A1%E6%89%A9%E5%B1%95%E9%98%85%E8%AF%BB.pdf)和![扩展阅读2](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/7-%E7%AC%AC4%E7%AB%A0%20Kalman%E6%BB%A4%E6%B3%A2%E5%99%A8%E6%89%A9%E5%B1%95%E9%98%85%E8%AF%BB.pdf)

下面我们来讲怎么用，具体来讲，我们准备讲明白以下几点：

1. 这五个公式啥关系？

2. 给你![Matlab程序](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/kalmanfun.m)，来加深一下印象。

3. Kalman滤波器在使用时的一些小技巧。

### 1. 这五个公式啥关系？
![Kalman滤波器](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/KalmanFiler.png)


Kalman滤波器5个公式的关系
### 2. 给你Matlab程序，来加深一下印象。
    
    function [xe,pk,p1]=kalmanfun(A,C,Q,R,xe,z,p) 
    xe=A*xe;                     
    P1=A*p*A'+Q;               
    K=p1*C'*inv(C*p1*C'+R);     
    xe=xe+K*(z-C*xe);            
    pk=(eye(size(p1))-l*C)*p1;   

### 3. Kalman滤波器在使用时的一些小技巧。
#### 稳态Kalman滤波器是啥？有什么用？
运行一下本文件夹中的![这个程序](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/C4_1.m)，感受一下Kalman滤波器是怎样快速收敛到稳态的。别忘了还需要下载它所需的![函数](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/steadycov.m)!!

 分析一下程序运行结果，说说估计的方差说明什么？方差越大说明什么？

### 练习
利用MATLAB实现以下问题。
![kalman滤波器](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/CouseWork2forKalman.png)
如果你已经完成了问题1，那么就从第2个问题开始吧。


# 第三次课
我们讲述四种不同的状态融合估计方法。
![多传感器系统模型](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/MultisensorSystem.png)
![四种融合方法](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/FourFusionMethods.png)
关于这四种融合方法的![简要描述]见(https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/9-%E5%A4%9A%E4%BC%A0%E6%84%9F%E5%99%A8%E8%9E%8D%E5%90%88%E6%96%B9%E6%B3%95.pdf)，详细的扩展阅读参见![文档](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson1/9-%E5%A4%9A%E4%BC%A0%E6%84%9F%E5%99%A8%E8%9E%8D%E5%90%88%E6%96%B9%E6%B3%95-%E6%89%A9%E5%B1%95%E9%98%85%E8%AF%BB.pdf)。

### 作业
需要在前两个问题的基础上，完成以下作业的第3题。
![第一次仿真作业](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/HomeWork1forFusion.png)

## 参考文献

[1] 金学波，![Kalman滤波器理论与应用——基于MATLAB实现](http://www.ecsponline.com/goods.php?id=177510)，科学出版社，2016，第2章、第4章
