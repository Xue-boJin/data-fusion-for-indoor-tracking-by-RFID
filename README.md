# RFID测量模型
## MATLAB语言
### 编程知识之一：matlab程序结构
MATLAB语言广泛应用于各种仿真研究中，尤其是自动控制领域。与Python，R等具有计算功能的语言相比，MATLAB具有更为专业的工具包。
MATLAB程序通常包括四部分，下面我们来详细说明。
#### 第一部分：清除主界面和内存空间
MATLAB几十年来一直沿用主界面风格，可以在命令窗口（Command window）上调试某一条语句是否正确，还可以执行输入命令。当程序出现错误时，命令窗口也会出现红色报错提示，想要输出某个变量的结果时，命令窗口也会非常方便地显示运行结果。可见主界面的内容是相当丰富的，但主界面保存的变量并不会自己清空，其历史命令（Command history）及工作空间 (Workspace)的变量自动保存着。
这会使用户弄不清楚哪个是当前程序的执行结果，当程序报错时，也给错误排查带来了困难。因此在程序执行的开始，最好清除主界面现有的内容，这样在本次程序执行之后，方便分析本次程序执行的结果。

在MATLAB中，清除主界面的语句是

    clc; 
    
清空内存变量是  

    clear; 
    
关闭所有图形窗口是

    close all; 
    
建议使用者在程序的开始就使用以上命令，这个习惯对管理程序数据空间很有帮助。
MATLAB的“管辖”的数据空间范围包括内存空间、路径，输入命令，类似这样的超简单的语句：

    a=b+1
MATLAB首先寻找变量b的值，如果内存空间已经有该变量的值，该语句在执行的时候就不会出错。但如果变量b在之前的程序中已被赋值，那么，在内存空间中已经存在b值，当前执行的程序当中并没有对b进行赋值，但由于MATLAB在内存空间中有b值就导致a被赋值。

然而，此时程序是错的，因为没有在使用变量之前进行赋值。人们会大呼“程序通过了！”然后，很开心地关机，当下一次打开MATLAB时，MATLAB会再次运行原程序，会发现系统出现错误提示“b没有赋值”，这对一个初学者来讲是相当费解的一件事：程序昨天还好好的，为什么又出现了错误？

现在明白了吧：由于没有使用clear语句清除内存空间，导致最初运行程序时，b变量没有初始化的错误“漏”报。

这样的错误不是每次都会有，但是在算法研究的过程中错误率的确非常高。初学者由于缺乏专业的编程经验，在变量命名时比较随意，常常使用c、A、PP、n等简单的字母变量，在内存空间中留下痕迹。因此，养成一个好习惯至关重要，即在程序的开始使用清除主界面的clc语句，在“视觉”上有一个良好的开始，迎接“干干净净”的主界面；使用clear清除内存空间，使内存空间“干干净净”，程序每次都重新开始。

#### 第二部分
设置问题中交代的因变量，一般是一些已知的数据；

#### 第三部分
需要解决计算问题的结果变量，需要依据题意进行计算；

#### 第四部分
结果输出，有的只需要输出数据，而大多数情况下都需要用图形来表达。这几部分很多MATLAB书籍进行了详细介绍，本书不再赘述。下面使用一段具体的实例进行说明。
    
#### 例
假设温度传感器A具有均匀分布测量噪声，噪声的均值为0，方差为2，请模拟当室内温度是20的时候，传感器的输出数据是多少？给出1000个数。

    % 清除主界面和内存空间
    clc;
    clear;
    % 设置变量：
    m=20;
    v=2;
在MATALB中，通过使用randn函数产生随机数。这里，测量值是真实值与测量噪声的叠加。根据测量方差和均值可以模拟出噪声，也就是将randn产生的结果乘以标准差，然后加上期望均值并将其与真实值叠加：

    % 室内温度
    s1=m+sqrt(v)*randn(1,1000); ％这里期望均值为0，所以语句中没有显示均值。
最后，将模拟出的测量噪声如图所示，测量噪声是一个离散序列，所以形式非常简单，使用plot函数就可以实现：

    plot(s1)
    xlabel(‘采样时刻’)
    ylabel(‘测量数据’)
![模拟传感器A的测量数据输出](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/2SensorA.png)


模拟传感器A的测量数据输出

MATLAB画图函数非常丰富，还可以对图设定适当的标注来提高效果图的表达方式和内容，增强可视化效果，比如横坐标、纵坐标的设置，用不同线型来区别不同变量的曲线，或在一张图上画出多个图进行对比分析。详情可查阅MATLAB相关书籍。

下面再看几个类似的例子：
#### 例
若传感器B的噪声更大些，其噪声的均值为0，方差为8，请模拟当室内温度是20的时候，传感器的输出数据是多少？给出1000个数。
同理，MATLAB程序应该有四大部分，可以给出下面这段程序：

    %C2_1
    clc;
    clear;
    m=20; 
    v=8; 
    s2=m+sqrt(v)*randn(1,1000); 
    plot(s2) 
    xlabel(‘采样时刻’) 
    ylabel(‘测量数据’) 
 
![模拟传感器B的测量数据输出](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/2SensorB.jpg)


模拟传感器B的测量数据输出

#### 例
如果室温在上升，实际的上升曲线是2*t+20，传感器A的输出数据是多少？给出1000个数。

与上面两例不同，本例的实际室温随着时间的变化而变化，为了描述这个关系，需要给出时间t的变化，然后再考虑测量噪声与真值的关系。在实际的仿真中，需要指定时间t的仿真范围，也就是开始时间和结束时间，一般情况下开始时间可以设为从0开始，而结束的时间则可以根据实际情况进行设置。但是题中要求我们给出1000个数据，也就是t要包含1000个数据点。

我们可以用语句t=0:0.01:9.99来表示从0时刻到9.99秒的采样时间，每0.01秒采集的一个数据共获得1000个测量数据。或者使用另外一个语句t=linspace(0,9.99,1000)，也能输出1000个结果值。若使用传感器A进行测量，在真值之上需要叠加测量噪声获得测量数据，程序如下
    
    %C2_2 
    clc; 
    clear; 
    t=0:0.01:9.99; 
    m=2*t+20; 
    v=2; 
    s3=m+sqrt(v)*randn(1,1000); 
    plot(t,s3) 
    xlabel('t') 
    ylabel('measurement data')

![室内温度变化时模拟传感器A测量数据的输出](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/IndoorTemperatureChange.jpg)


室内温度变化时模拟传感器A测量数据的输出

### 编程知识之二：MATLAB函数文件 
本小节对MATLAB函数的知识进行简单介绍。

MATLAB语言除了主程序（如上述编写的这些小程序）之外，还可以编写函数文件。

以下面的小例子来说明函数文件的格式： 
1）在MATLAB的新建function文件中，编写如下程序并进行保存： 

    function s = sumfunc (a,b) s = a+b； 
    
2）然后在MATLAB的工作空间中调用sumfunc函数，便可完成MATLAB函数的编写目的。 

在上述程序中，文件需要有关键字，即文件中第一行。函数文件必须由function开头，然后标明函数的输入输出变量。在函数体中需要表明函数输入输出变量之间的关系，如在上述小例子中，函数的输入输出是简单的求和关系。

在调用函数时可以使用

    y=sumfunc (3,4)
语句，会得出y=7的计算结果。

总结一下，本小节介绍了仿真语言的基础知识，以编写仿真程序的四部分步骤为例，简单介绍了MATLAB语言的基本使用方法，以及函数的编写。给出了几个小实例，来说明仿真过程产生的数据方法。如果想要更深入地了解MATLAB语言，可以参阅其它相关书籍。

## 几类跟踪系统中常用曲线的模拟 
本节给出几种常用的跟踪目标轨迹数据，包括目标做匀速直线运动、目标做蛇形机动、圆周运动、先做匀速直线运动再作圆周运动，以及在二维平面内做任意方向机动的模拟轨迹数据。本书不仅给出目标做各种运动的测量数据，还给出相应的程序，供读者使用。有的程序调用了函数，有的程序没有，并没有统一的格式，给出这些程序的另一个目的在于让读者熟悉这些MATLAB程序，方便读者编制自己的测量数据模拟程序。 

#### 例 匀速直线运动模拟 
下面函数funtrackingline能够模拟目标做匀速直线运动数据，其中输入变量a表示匀速直线运动的斜率，t是一个向量，该向量通过从运动的开始时间到终止时间以采样周期为间隔对时间序列进行采样得到，R是测量噪声，输出变量包括两个，一个是yreal，它表示目标的真实运动，不含有传感器的测量噪声，另一个是ym，加入了传感器的测量噪声，是实际系统的测量数据。 
     
     function [yreal,ym]=funtrackingline(a,t,R) 
     yreal=a*t; 
     ym=yreal+randn(size(yreal))*sqrt(R); 
     
调用函数funtrackingline，在程序中先设置输入参数，比如斜率a为3，t是从0到10、采样间隔0.1的采样时刻向量，测量噪声的方差R为30，然后把结果画出来。图中横坐标是t，纵坐标是测量数据。图中画出两条曲线，一条是目标运动的实际数据，一条是带有传感器测量噪声的测量数据。具体程序如下：

    clc 
    clear 
    a=3;
    t=0:0.1:10;
    R=30; 
    [yreal,ym]=funtrackingline(a,t,R); 
    plot(t,yreal,t,ym) 
    xlabel('t') 
    ylabel('测量数据') 
    legend('目标运动的实际数据','传感器测量数据')

![匀速直线运动模拟数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/UniformMotion.jpg) 


匀速直线运动模拟数据

#### 例 蛇型机动的正弦曲线模拟 
给出函数funtrackingsnake，里面包括四个输入变量，其中a是正弦曲线的振幅，omig指正弦曲线的角加速度，和前面一样，t表示从开始到结束由每个采样点组成的采样时刻向量，R是测量噪声的方差。同样，输出变量有两个，一个是不带测量噪声的yreal，一个是带有测量噪声的ym。 

    function [yreal,ym]=funtrackingsnake(a,omig,t,R) 
    yreal=asin(omigt); 
    ym=yreal+randn(size(yreal))*sqrt(R);

调用函数funtrackingsnake，设置相应的参数再进行适当标注，程序如下: 

    a=2;omig=pi/4;R=3; t=0:0.1:10; 
    [yreal,ym]=funtrackingsnake(a,omig,t,R); 
    plot(t,yreal,t,ym) 
    xlabel('t') 
    ylabel('测量数据') legend('目标运动的实际数据','传感器测量数据') 

![蛇型机动的正弦曲线模拟数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/snake.jpg)

蛇型机动的正弦曲线模拟数据
#### 例 圆周运动模拟 
下面这段程序没有使用函数，直接给出了产生圆周运动的程序，其中各个量的说明已经在程序中%后面做了标注。

程序中直接设置了几个参量，包括起点（2000,0），线速度300，半径2000，圆心（0，0），读者可以根据自己的实际需要来重新定义各个变量的具体数值。ww是角度，程序中用正弦、余弦分别计算横纵坐标的数值，利用
     
     plot(x(1,:),x(2,:),'*')
画出一张二维图，另一张图分别给出横纵坐标的量，把它们画在一张图上。 

程序具体如下： 

    clc 
    clear 
    x0=[2000,0]; 
    v=300;%线速度 
    T=1; 
    r=2000;%半径 
    w=v/r; 
    op=[0 0];%圆心 
    x=[];xt=[];www=[];ww=0; 
    for t=1:T:50 
    ww=ww+w; 
    x2=[cos(ww)r+op(1);sin(ww)r+op(2)]; 
    x=[x x2]; xt=[xt t]; www=[www ww]; 
    end 
    plot(x(1,:),x(2,:),'*') 
    xlabel('横轴模拟数据') 
    ylabel('纵轴模拟数据') 
    figure 
    plot(xt,x,'*') 


![目标在二维平面内圆周运动模拟数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/circle1.jpg)


目标在二维平面内圆周运动模拟数据

![目标做圆周运动时的横、纵轴数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/circle2.jpg)


目标做圆周运动时的横、纵轴数据
#### 例 匀速直线运动+圆周运动目标的真实轨迹模拟 
先请看下面的函数

    function [xt,y]=funtrackinglinecircle(T,Tt,Tz,R) %T:采样周期 %Tt:直线运行时间 %Tz：圆周运行时间 %R：测量噪声方差
    %本程序模拟匀速直线运动+圆周运动目标的真实轨迹 %功能描述： 
    % 针对某机动目标运动的特点，假设某运动目标经历了两个航行阶段： 
    % 初始匀速直线运动、匀速圆周转弯机动运动。将目标建立在二维坐标系中，初始位置为XXX，目标线速度为XXX; 
    % 以XX角速度向斜上方运动，目标运行Tt秒后，作向心wv ms/s^2的匀加速圆周运动，速度的大小v保持不变。 
    x0=[0 -2000]';%初始位置 
    v=200;%速度 
    vj=pi/4;%与水平方向所成角度
    x=[];xt=[]; 
    for t=1:T:Tt 
    x2=[sin(vj)*v+x1(1);cos(vj)*v+x1(2)]; 
    x=[x x2]; xt=[xt t]; x1=x2; 
    end
    % % % 圆周运动 
    x0=x2; 
    v=200;%线速度 
    r=2000;%半径 
    w=v/r; 
    op=[x0(1)-r x0(2)];%圆心 
    x1=x0;www=[];ww=0; 
    for tt=t:Tz+t 
    ww=ww+w 
    x2=[cos(ww)*r+op(1);sin(ww)*r+op(2)]; 
    x=[x x2]; xt=[xt tt]; x1=x2; www=[www ww]; 
    end 
    y=x+randn(size(x))*sqrt(R); 
funtrackinglinecircle函数的输入量有四个：采样周期T，直线运动时间Tt，圆周运动时间Tz和测量噪声的方差R。

从函数中可看出，有些变量是已经设置好的，比如初始位置（0，-2000），还有线速度以及作直线运动时与水平方向产生的角度。程序先进行一段直线运动，运行到最后的点x2。结束for循环之后的下一个起点就是x2，设置了线速度以及运动的半径，给出圆心，又用for循环里的正、余弦进行圆周模拟运动。

最后，对给出的目标真实运动轨迹x加上测量噪声，噪声方差是R。 函数有两个输出：一个是xt，一个是y。xt是运动的时间，y是加上测量噪声之后的传感器测量的输出。下面的程序调用上面的函数，程序调用的时候要设置四个输入量，如采样周期为1秒，直线运动时间为20秒，然后做圆周运动50秒，测量噪声方差为1000。 

    T=1;Tt=20;Tz=50;R=1000; 
    [xt,y]=funtrackinglinecircle(T,Tt,Tz,R); 
    plot(y(1,:),y(2,:)) 
    xlabel('横轴模拟数据') 
    ylabel('纵轴模拟数据') 
    figure subplot(2,1,1),plot(xt,y(1,:))
    xlabel('t');ylabel('横轴模拟数据') 
    subplot(2,1,2),plot(xt,y(2,:)) 
    xlabel('t');ylabel('纵轴模拟数据')

![目标先做直线运动、再做圆周运动时的二维平面运动](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/linecircle.png)


目标在平面上运动的情形，可以看出目标从起点开始先做直线运动，然后向左上方转弯，走了一个圈。因为数据带有一定的测量噪声，所以图形看起来不太规整。

![目标先做直线运动、再做圆周运动时的横、纵轴数据](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/linecircle2.png)


目标先做直线运动、再做圆周运动时的横、纵轴数据

## GPS跟踪系统的机动目标轨迹模拟 
首先介绍一下GPS系统的数据采集特征，即传感器测量特征。GPS系统可以测量二维空间，并且该测量与横、纵坐标不相关。一般情况下，横、纵坐标都含有噪声，方差已知，因此模拟的测量数据需要包含横纵坐标，是2维数据。 
### 例 下面给出在2维平面内目标做任意曲线运动的测量数据模拟程序。
这段程序使用了函数axis，这个函数可以设置坐标轴，即横、纵坐标的起点和终点，

    axis([0 100 0 100])
表示横、纵坐标的起点和终点都是从0到100，前两个数值表示横坐标的起点和终点，后两个数值表示纵坐标的起点和终点。

    hold on
函数的功能是保持目前图形窗口的状态，即接下来的图会画在目前的图形窗口上。 

程序中还使用了两个disp函数，功能是给出说明，disp（）里面的任何字符都会显示在窗口上。这里显示的内容是本程序的使用说明：使用鼠标左键点出每一个点，点击右键表示点击该点后结束数据产生步骤。为什么这样提示呢？因为这段程序可以使用坐标在横、纵坐标轴从0~100的区间的任意一点来画点，并记住每一个点的前后顺序，还能把这些点连成一条曲线。

那么怎么实现记录每一个点呢？用

    ginput
这个函数，用for循环来记录所有用左键点击的点。

ginput函数输入1表示点左键，输出是点击点的横、纵坐标值。每点击一个点，在程序中都会用红色圆圈画出来，不过注意在点击鼠标左键点时不要太快，否则会丢点。接下来把所有点用函数spline连成一条光滑曲线，使用spline函数需要设置插入的点数，程序中在每两个点之间插入10个点，这样能形成一条光滑曲线，来模拟在平面上机动目标走过的曲线。 

最后使用subplot，把横、纵坐标放在一张图上，其中实线是机动目标走过的真实的轨迹，不带测量噪声。红色点模拟的是带有测量噪声的传感器测量输出。 

    %使用说明：使用鼠标左键可以产生轨迹的各个点，鼠标右键为结束点。 
    axis([0 100 0 100]) 
    hold on % 程序变量初始化 
    xy = []; 
    n = 0; % 使用循环，得到鼠标点击左键是的坐标位置 
    disp('Left mouse button picks points.') %%在主窗口上提示操作方法 
    disp('Right mouse button picks last point.') 
    but = 1; 
    while but == 1 [xi,yi,but] = ginput(1); %%该函数可以得到鼠标左键的坐标点 
    plot(xi,yi,'ro') n = n+1; xy(:,n) = [xi;yi]; 
    end % 利用插值函数获得光滑曲线，模拟目标运动曲线和测量数据。 
    t = 1:n; ts = 1: 0.1: n; xys = spline(t,xy,ts); plot(xys(1,:),xys(2,:),'b-'); %%用蓝色直线画出目标运动曲线 
    Rx=10;Ry=10; %%设置横轴、纵轴的测量噪声方差Rx、Ry
    plot(xys(1,:)+randn(size(xys(1,:)))*sqrt(Rx),xys(2,:)+randn(size(xys(1,:)))*sqrt(Ry),'k.'); %%，在2维坐标下用黑色点画出每一个测量数据 
    xlabel('x轴');ylabel('y轴') 
    hold off 
    
    %在另一张图上分别画出横、纵轴的目标运动数据和测量数据。 
    figure subplot(2,1,1),plot(xys(1,:)) hold on 
    subplot(2,1,1),plot(xys(1,:)+randn(size(xys(1,:)))*sqrt(Rx),'.') 
    ylabel('横轴模拟数据');
    subplot(2,1,2),plot(xys(2,:)) hold on 
    subplot(2,1,2),plot(xys(2,:)+randn(size(xys(1,:)))*sqrt(Rx),'.') 
    ylabel('纵轴模拟数据') hold off 
    %存储数据 
    save mytarget1 xys ts 

![GPS系统的机动目标轨迹模拟](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/GPS1.png)


GPS系统的机动目标轨迹的模拟数据
![GPS系统的机动目标轨迹横、纵坐标轴数据模拟](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/GPS2.png)


GPS系统的机动目标轨迹横、纵坐标轴的模拟数据


## RFID跟踪系统的机动目标轨迹模拟
下面先来看RFID系统测量模型。
![RFID测量模型](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/resource/RFIDmodel.png)
我们先来看右边第1个公式，这里描述的是携带标签的目标到阅读器的距离。但是由于传感器的测量噪声，使得阅读器获得的距离不是这个真实距离，而是加上一个测量噪声，也就是，公式2表示的。这个测量噪声的方差和距离有关，也就是说距离越长，所引入的测量噪声方差就会越大，越不准确，它的描述方法见公式3。

RFID跟踪系统仿真平台见Matlab程序![RFID_creater_GUI_final.m](https://github.com/Xue-boJin/data-fusion-for-indoor-tracking-by-RFID/blob/Lesson2/RFID_creater_GUI_final.m)。

参考文献

[1] 金学波，![Kalman滤波器理论与应用——基于MATLAB实现](http://www.ecsponline.com/goods.php?id=177510)，科学出版社，2016，第2章、第6章
