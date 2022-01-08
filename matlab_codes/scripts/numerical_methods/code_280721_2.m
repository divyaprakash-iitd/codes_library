clear; clc; close all;

% Description: Soles an IVP using Runge-Kutta 4th order method.

% Parameters
a = 0.1;
b = 0.0007;

odefun = @(t,y) [-b*y(1)*y(2);
                  b*y(1)*y(2) - a*y(2);
                  a*y(2)];

S0 = 999; I0 = 1; R0 = 0;
y0 = [S0 I0 R0];
tStart = 0; tEnd = 70;
h = 0.001;
tspan = [0 70];

[t,y] = RK4(odefun,tspan,y0,h);

plot(t,y)
xlabel('t')
legend('S(t)','I(t)','R(t)')

function [t,y] = RK4(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i,:))';
        k2 = fun(t(i)+dt/2, y(i,:)+dt*k1/2)';
        k3 = fun(t(i)+dt/2, y(i,:)+dt*k2/2)';
        k4 = fun(t(i)+dt,y(i,:)+dt*k3)';
        
        y(i+1,:) = y(i,:) + 1/6*dt*(k1 + 2*k2 + 2*k3 + k4);
    end
end