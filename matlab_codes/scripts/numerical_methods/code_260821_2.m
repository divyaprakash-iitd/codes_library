clear; clc; close all;

% Description: Solves an ODE using the RK-4 method, ode45 and ode23.

fun = @(t,y) 5*(y-t.^2);
dt = 0.03125;
tspan = [0 5];
y0 = 0.08;

% RK4
[t,y] = RK4(fun,tspan,y0,dt);
figure(1)
plot(t,y)
title('RK4')

% ode45
[t,y] = ode45(fun,tspan,y0);
figure(2)
plot(t,y)
title('ode45')

% ode23
[t,y] = ode23(fun,tspan,y0);
figure(3)
plot(t,y,'DisplayName','ode23')
title('ode23')

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