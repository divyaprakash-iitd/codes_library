clear; clc; close all;

% Description: Solves the IVP problem using Euler's method and ode45

% Parameters
h = input('Enter the value of h: ');
n = input('Enter the value of n: ');
%h = 0.01; n = 10;

fun = @(t,y) 2*y - 2 + 3*exp(-t);

t0 = 0;
tN = n*h;
y0 = 0;

% Ode45 (Actual Solution)
[t,y] = ode45(fun,t0:h:tN,y0);
plot(t,y,'linewidth',2,'DisplayName','ode45')
hold on

title(func2str(fun))
legend('location','northwest')

[t,y] = euler_ivp(fun,t0,y0,tN,h);
plot(t,y,'--','linewidth',2,'DisplayName',sprintf('Euler: h = %.2f, n = %d',h,n));
xlabel('t')
ylabel('y(t)')
