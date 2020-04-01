clear
clc
x0=5;
for i=1:50
    x(i)=0.7*x0+sqrt(1)*rand(1);
    z1(i)=x(i)+sqrt(1)*rand(1);
    z2(i)=3*x(i)+sqrt(3)*rand(1);
    x0=x(i);
end

plot(x)
figure
plot(z1);hold on
plot(z2)
save myfusiondata x z1 z2
