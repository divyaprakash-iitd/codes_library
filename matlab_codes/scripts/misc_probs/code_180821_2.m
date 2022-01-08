clear; clc; close all;

a1 = 0.1; a2=0.12;a3=0.3;a4=0.15;
fun = @(t,x) [(a1-a2*x(2))*x(1); (-a3+a4*x(1))*x(2)];

tStart = 0; tEnd = 150;
x10 = 3; x20 = 0.5;
dt = 0.5;

[t,x] = euler_ivp(fun,[tStart tEnd],[x10 x20],dt);

figure(1)
yyaxis left
plot(t,x(:,1))
xlabel('t')
ylabel('x')
yyaxis right
plot(t,x(:,2))
ylabel('y')

figure(2)
plot(x(:,1),x(:,2))
xlabel('x')
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
