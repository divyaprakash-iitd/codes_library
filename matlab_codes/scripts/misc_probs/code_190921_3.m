clear; clc; close all;

% Description: Plots the given function
figure(1)
t = -5:0.0001:5;
x = 2*rectpuls(t,2);
subplot(3,1,1)
plot(t,x,'r'), grid
title(' Triangular pulse with width of 2')

t1 = 2*t;
x1 = 2*rectpuls(t1,2);
subplot(3,1,2)
plot(t,x1,'b'),grid
title(' Triangular pulse with width of 1')

t3 = 1/2*t;
x3 = 2*rectpuls(t3,2);
subplot(3,1,3)
plot(t,x3,'g'),grid
title(' Triangular pulse with width of 4')

x = @(t) exp(t/2);
t = linspace(-5,0.5,1000);

figure(2)
plot(t,x(-t))
