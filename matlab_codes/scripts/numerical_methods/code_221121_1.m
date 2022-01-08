clear; clc; close all;

% Description: Solves a problem numerically using Euler and RK4

odefun = @(t,z) [z(2);
                 7.5*cos(t) - 0.05*z(2) - z(1)^3];

z0 = [0 1];
tspan = [0 70];

x1Exact = 1.582857756103056;
x2Exact = -2.835763853877514;

E = @(x1,x2) sqrt((x1-x1Exact).^2 + (x2-x2Exact).^2);

dt = linspace(-6,-3,10);

% figure(1)
% hold on
% for i = 1:numel(dt)
%     [~,z] = euler_ivp(odefun,tspan,z0,dt(i));
%     plot(dt(i),E(z(end,1),z(end,2)),'k*')
%     E(z(end,1),z(end,2))
% end

dt = linspace(-6,-1,10);
figure(2)
hold on
for i = 1:numel(dt)
    [~,z] = RK4(odefun,tspan,z0,dt(i));
    plot(dt(i),E(z(end,1),z(end,2)),'k*')
end
set(gca, 'XScale', 'log', 'YScale', 'log')



function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
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

