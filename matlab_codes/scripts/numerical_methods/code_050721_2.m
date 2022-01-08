clear; clc; close all;

% Description: Solves the IVP problem using Euler's method and ode45

% Parameters
h = input('Enter the value of h: ');
n = input('Enter the value of n: ');
%h = 0.01; n = 10;

fun1 = @(t,y) 2*y +  cos(t);
fun2 = @(t,y) exp(-t) - 3*y;

funcs = {fun1, fun2};

t0 = [0 -1];
tN = n*h;
y0 = [-2/5 0];

for i = 1:2
    % Ode45 (Actual Solution)
    [t,y] = ode45(funcs{i},t0(i):h:tN,y0(i));
    figure(i)
    plot(t,y,'linewidth',2,'DisplayName','ode45')
    hold on

    title(func2str(funcs{i}))
    legend('location','south')

    [t,y] = euler_ivp(funcs{i},t0(i),y0(i),tN,h);
    plot(t,y,'--','linewidth',2,'DisplayName',sprintf('Euler: h = %.2f, n = %d',h,n));
    xlabel('t')
    ylabel('y(t)')
end
