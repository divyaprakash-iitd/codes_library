clear; clc; close all;

% Description: Solves a system of equations

A = @(c) [  1/c, -5 -2;
            6, 3/c, 1;
            7, 3, -5/c  ];
b = [11, 13, 10]';

c = 5
x = A(c)\b

N = 100;
c = linspace(0.5,10,N);

x = zeros(3,N);
for i = 1:N
    x(:,i) = A(c(i))\b;
end

figure(1)
subplot(3,1,1)
plot(c,x(1,:))
xlabel('c')
ylabel('x')

subplot(3,1,2)
plot(c,x(2,:))
xlabel('c')
ylabel('y')

subplot(3,1,3)
plot(c,x(3,:))
xlabel('c')
ylabel('z')

figure(2)
plot3(x(1,:),x(2,:),x(3,:))
xlabel('x')
ylabel('y')
zlabel('z')
title('0.5<=c<=10')
grid on

