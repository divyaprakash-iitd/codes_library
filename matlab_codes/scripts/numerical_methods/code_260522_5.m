clear; clc; close all;

% Description: Finds fourier coefficients
dx = 0.1;
x = [-pi:dx:0, dx:dx:pi];
y = (x<0) - (x>=0);

a0 =    0.008871;  
a1 =     0.01297; 
b1 =      -1.219;
w =      0.8159;
fittedmodel1 = @(x) a0 + a1*cos(x*w) + b1*sin(x*w);

plot(x,y,'DisplayName','f(x)')
hold on
plot(x,fittedmodel1(x),'DisplayName','F1(x)')

a0 =     0.02991; 
a1 =    -0.02773; 
b1 =      -1.132; 
a2 =     0.03993; 
b2 =     -0.2365; 
w =      0.7062 ; 

fittedmodel2 = @(x) a0 + a1*cos(x*w) + b1*sin(x*w) + ...
       a2*cos(2*x*w) + b2*sin(2*x*w);

plot(x,fittedmodel2(x),'DisplayName','F2(x)')

a0 =     0.00988;
a1 =     0.01285;
b1 =      -1.253;
a2 =     0.01893;
b2 =    -0.03935;
a3 =     0.01441;
b3 =     -0.3673;
w =      0.8751;

fittedmodel3 = @(x) a0 + a1*cos(x*w) + b1*sin(x*w) + ...
       a2*cos(2*x*w) + b2*sin(2*x*w) + a3*cos(3*x*w) + b3*sin(3*x*w);

plot(x,fittedmodel3(x),'DisplayName','F3(x)')
grid on
legend show