clear; clc; close all;

% Description: Solves a system of first order ODEs using the Euler's
% Method.

odefun = @(t,x) [-t + x(1) - x(2);
                 -x(1) - x(2)];

y0 = [4 4];
[t,x] = euler_ivp(odefun,[0 5],y0,0.001);

yyaxis left
plot(t,x(:,1))
xlabel('t')
ylabel('x')

yyaxis right
plot(t,x(:,2))
ylabel('y')


function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end