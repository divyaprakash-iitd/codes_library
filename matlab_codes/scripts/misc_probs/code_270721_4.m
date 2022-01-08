clear; clc; close all;

% Description: Solves an Initial Value Problem using Runge-Kutta Fourth
% Order Method.

a = 0.0161;

dPdt = @(t,P) a*P; 

tStart = 2000; tEnd = 2020;
dt = 5;
P0 = 6080;

[t,P] = RK4(dPdt,[tStart tEnd],P0,dt);

fprintf('Year    Population[Million]\n')
fprintf('---------------------------\n')
for i = 1:numel(t)
    fprintf('%4.0f    %10.0f\n',t(i),P(i))
end

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