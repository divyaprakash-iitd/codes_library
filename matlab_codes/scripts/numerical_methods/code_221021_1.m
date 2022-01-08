clear; clc; close all;

% Solves a threebody problem using RK4


x0 = 1.2; y0 = 0;
vx0 = 0; vy0 = -1.0493571;
t0 = 0; tf = 10;
fd = 0;
N = 10000;
dt = (tf-t0)/N;
tol = 0.01;
[x,y,yx,yy,t] = myrk4(t0,tf,dt,x0,y0,vx0,vy0,fd,tol);

plot(x,y)

function [x,y,yx,yy,t] = myrk4(t0,tf,dt,x0,y0,vx0,vy0,fd,tol)


mu = 1/82.45;
mubar = 1-mu;
r1 = @(x,y) sqrt((x+mu)^2 + y^2);
r2 = @(x,y) sqrt((x-mubar)^2 + y^2);

% Let 
% x     = x(1),
% dx/dt = dx1/dt = x(2)
% y     = x(3)
% dy/dt = dx3/dt = x(4)

fun = @(t,x) [x(2);
                 2*x(4) + x(1) - mubar*(x(1)+mu)/r1(x(1),x(3))^3 - mu*(x(1)-mubar)/r2(x(1),x(3))^3 - fd*x(2);
                 x(4);
                 -2*x(2) + x(3) - mubar*x(3)/r1(x(1),x(3))^3 - mu*x(3)/r2(x(1),x(3))^3 - fd*x(4)];
             

    y0 = [x0,vx0,y0,vy0];
    t           = t0:dt:tf;
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
    Y = y;
    x   = Y(:,1);
    yx  = Y(:,2);
    y   = Y(:,3);
    yy  = Y(:,4);
end