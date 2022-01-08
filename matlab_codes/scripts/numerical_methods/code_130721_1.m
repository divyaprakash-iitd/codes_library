clear; clc; close all;

% Description: Solves an IVP using Euler's Method.

df = @(x,y) exp(x) + y;

% Analytical Solution
f = @(x,y) exp(x).*x + (1-exp(1)).*exp(x-1);

x0 = 1; xN = 2;
dx = 0.01;
y0 = 1;

[x,y] = euler_ivp(df,x0,y0,xN,dx);

hold on
plot(x,f(x),'linewidth',2,'DisplayName','Analytical')
plot(x,y,'-.','linewidth',2,'DisplayName',"Euler's Method")
xlabel('x')
ylabel('y')
legend('location','northwest')

fprintf('f(2) = %.4f\n',y(end))
fprintf('Actual Error = %.4f\n',f(x(end))-y(end))