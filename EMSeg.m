function [mask,mu,v,p]=EMSeg(ima,k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Expectation Maximization image segmentation
%
%   Input:
%          ima: grey color image
%          k: Number of classes
%   Output:
%          mask: clasification image mask
%          mu: vector of class means 
%          v: vector of class variances
%          p: vector of class proportions   
%
%   Example: [mask,mu,v,p]=EMSeg(image,3);
%
%   Author: Prof. Jose Vicente Manjon Herrera
%    Email: jmanjon@fis.upv.es
%     Date: 02-05-2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% check image
ima=double(ima);
copy=ima;           % make a copy
ima=ima(:);         % vectorize ima
mi=min(ima);        % deal with negative 
ima=ima-mi+1;       % and zero values
m=max(ima);
s=length(ima);

% create image histogram

h=histogram(ima);
x=find(h);
h=h(x);
x=x(:);h=h(:);

% initiate parameters

mu=(1:k)*m/(k+1);
v=ones(1,k)*m;
p=ones(1,k)*1/k;

% start process

sml = mean(diff(x))/1000;
while(1)
        % Expectation
        prb = distribution(mu,v,p,x);
        scal = sum(prb,2)+eps;
        loglik=sum(h.*log(scal));
        
        %Maximizarion
        for j=1:k
                pp=h.*prb(:,j)./scal;
                p(j) = sum(pp);
                mu(j) = sum(x.*pp)/p(j);
                vr = (x-mu(j));
                v(j)=sum(vr.*vr.*pp)/p(j)+sml;
        end
        p = p + 1e-3;
        p = p/sum(p);

        % Exit condition
        prb = distribution(mu,v,p,x);
        scal = sum(prb,2)+eps;
        nloglik=sum(h.*log(scal));                
        if((nloglik-loglik)<0.0001) break; end;        

        clf
        plot(x,h);
        hold on
        plot(x,prb,'g--')
        plot(x,sum(prb,2),'r')
        drawnow
end

% calculate mask
mu=mu+mi-1;   % recover real range
s=size(copy);
mask=zeros(s);

for i=1:s(1),
for j=1:s(2),
  for n=1:k
    c(n)=distribution(mu(n),v(n),p(n),copy(i,j)); 
  end
  a=find(c==max(c));  
  mask(i,j)=a(1);
end
end


function y=distribution(m,v,g,x)
x=x(:);
m=m(:);
v=v(:);
g=g(:);
for i=1:size(m,1)
   d = x-m(i);
   amp = g(i)/sqrt(2*pi*v(i));
   y(:,i) = amp*exp(-0.5 * (d.*d)/v(i));
end


function[h]=histogram(datos)
datos=datos(:);
ind=find(isnan(datos)==1);
datos(ind)=0;
ind=find(isinf(datos)==1);
datos(ind)=0;
tam=length(datos);
m=ceil(max(datos))+1;
h=zeros(1,m);
for i=1:tam,
    f=floor(datos(i));    
    if(f>0 & f<(m-1))        
        a2=datos(i)-f;
        a1=1-a2;
        h(f)  =h(f)  + a1;      
        h(f+1)=h(f+1)+ a2;                          
    end;
end;
h=conv(h,[1,2,3,2,1]);
h=h(3:(length(h)-2));
h=h/sum(h);





