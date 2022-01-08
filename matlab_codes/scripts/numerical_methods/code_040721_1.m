clear; clc; close all;

% Description: Solves a set of IVP using Heun's and Euler's Method.

fun1 = @(t,x,y) exp(-x+y) - cos(x);
fun2 = @(t,x,y) sin(x-3*y);

h = 0.1;
t = 0:h:1;
icx = 1;
icy = 2;

nt = numel(t);
x = zeros(1,nt);
y = zeros(1,nt);
x(1) = icx;
y(1) = icy;

% Heun's Method
for i = 1:nt-1
    x0 = x(i) + fun1(t(i),x(i),y(i))*h;
    x(i+1) = x(i) + (fun1(t(i),x(i),y(i))+fun1(t(i+1),x0,y(i)))/2*h;
    
    
    y0 = y(i) + fun2(t(i),x(i),y(i))*h;
    y(i+1) = y(i) + (fun2(t(i),x(i),y(i))+fun2(t(i+1),x(i),y0))/2*h;
end

figure(1)
hold on
plot(t,x,'-o','DisplayName',"Heun's Method")
xlabel('t')
ylabel('x')

figure(2)
hold on
plot(t,y,'-o','DisplayName',"Heun's Method")
xlabel('t')
ylabel('y')

% Euler's Method
for i = 1:nt-1
    x(i+1) = x(i) + fun1(t(i),x(i),y(i))*h;
    y(i+1) = y(i) + fun2(t(i),x(i),y(i))*h;
end

figure(1)
plot(t,x,'-o','DisplayName',"Euler's Method")
legend('location','northwest')
figure(2)
plot(t,y,'-o','DisplayName',"Euler's Method")
legend('location','northwest')
