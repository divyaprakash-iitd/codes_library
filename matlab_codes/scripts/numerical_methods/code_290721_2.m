clear; clc; close all;

% Description: Solves an IVP with different step sizes using the Euler's
% Method

fun     = @(t,y) 3*t.^2 + 5*t;
odefun  = @(t,y) 6*t + 5;

tStart = 0; tEnd = 0.6;
tspan = [tStart tEnd];
y0 = 0;

figure(1)
hold on
xlabel('t')
ylabel('y')
fprintf('   \x394t      y(0.3)   Error   y(0.6)    Error\n')
fprintf('-----------------------------------------------\n')
for dt = [0.3 0.15 0.075 0.0375]
    [t,y] = euler_ivp(odefun,tspan,y0,dt);
    fprintf('%8.5f %8.5f %8.5f %8.5f %8.5f\n',dt,y(t==0.3),fun(0.3)-y(t==0.3),y(t==0.6),fun(0.6)-y(t==0.6))
    plot(t,y,'-o','DisplayName',sprintf('\x394t=%.4f',dt))
end
plot(t,fun(t),'DisplayName','Exact Solution')
legend('location','northwest')

function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end