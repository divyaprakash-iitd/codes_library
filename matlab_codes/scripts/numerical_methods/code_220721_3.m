clear; clc; close all;

% Description: Solves an IVP using Runge-Kutta Method

fun = @(x,y) 3*x.^2.*y;

x0 = 0; xN = 1;
dx = 0.1;
y0 = 1;

[x,y] = RK4(fun,x0,xN,dx,y0);

plot(x,y,'^','DisplayName','RK4')
xlabel('x')
ylabel('y')

yExact = @(x) exp(x.^3);

hold on
xq = linspace(x0,xN,100);
plot(xq,yExact(xq),'DisplayName','Exact')
legend show


function [t,y] = RK4(fun,t0,tN,h,y0)
    t    = t0:h:tN;
    nt   = numel(t);
    y    = zeros(1,nt);
    y(1) = y0;
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i));
        k2 = fun(t(i)+h/2, y(i)+h*k1/2);
        k3 = fun(t(i)+h/2, y(i)+h*k2/2);
        k4 = fun(t(i)+h,y(i)+h*k3);
        
        y(i+1) = y(i) + 1/6*h*(k1 + 2*k2 + 2*k3 + k4);
    end
end