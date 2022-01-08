clear; clc; close all;

% Description: Solves an IVP using the second order runge kutta method.

odefun = @(t,y) [y(2);
                 1/2*(y(1)+y(2))];
             
tStart = 0; tEnd = 1;
tspan = [tStart tEnd];
dt = 0.5;
y0 = [1 -0.5];

[t,y] = RK2(odefun,tspan,y0,dt);
plot(t,y(:,1),'-o')
xlabel('x')
ylabel('y')

function [t,y] = RK2(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i,:))'.*dt;
        k2 = fun(t(i)+dt/2, y(i,:)+k1/2)'.*dt;
        
        y(i+1,:) = y(i,:) + k2;
    end
end