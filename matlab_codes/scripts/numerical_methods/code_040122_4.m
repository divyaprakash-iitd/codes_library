clear; clc; close all;

% Description: Solve coupled ode's using RK4

% Parameters
k1  = 1;
k2  = 2; 
k12 = 1;
m1  = 1;
m2  = 2;
c1  = 2;
c2  = 1;
l1  = 1;
l2  = 2;

% x(1) = x1, x(2) = dx1/dt, x(3) = x2, x(4) = dx2/dt
odefun = @(t,x) [x(2);
                 -k1/m1*x(1) + 2*pi*c1/m1/l1*sin(2*pi*x(1)/l1) - k12/m1*(x(1)-x(3));
                 x(4);
                 -k2/m2*x(3) + 2*pi*c2/m2/l2*sin(2*pi*x(3)/l2) + k12/m2*(x(1)-x(3))];
             
tspan = [0, 20];
x0 = [1 1 1 1];
dt = 0.001;
[t,x] = RK4(odefun,tspan,x0,dt);

plot(t,x(:,1))

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