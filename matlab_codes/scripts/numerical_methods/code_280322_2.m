clear; clc; close all;

% Description: Solves a system of ODE using Euler and Runke-Kutta methods

fun = @(t,y) [ y(2);
                  -3*y(2) - 2*y(1)];
tspan = [0, 4];
y0 = [10,-2];
dt = 0.1;

figure(1)
[t,yE] = euler_ivp(fun,tspan,y0,dt);
plot(t,yE(:,1),'-.','linewidth',2,'DisplayName','Euler')

[t,yRK] = RK4(fun,tspan,y0,dt);
hold on
plot(t,yRK(:,1),'--','linewidth',2,'DisplayName','RK')

yan = @(x) 2*exp(-2.*x).*(9*exp(x)-4);
plot(t,yan(t),'linewidth',1,'DisplayName','Exact')

legend show
xlabel('t')
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

