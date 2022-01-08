clear; clc; close all;

% Description: Solves an ODE using Euler's method

x0 = [9 8];
h = 0.02;
tspan = [0 5];
lamda = 3;
omg = 7;

odefun = @(t,x,lamda) [ x(2);
               -2*lamda*x(2) - omg^2*x(1)];
while 1
    lamda = lamda + 0.02;
    [t,x] = euler_ivp(@(t,x) odefun(t,x,lamda),tspan,x0,h);
    if ~any(x(:,1)<0)
        break;
    end
end

plot(t,x(:,1))
xlabel('t')
ylabel('x(t)')
grid on

fprintf('The value of lamda for which x(t) is never negative on [0,5] is: %.2f\n',lamda)

function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end