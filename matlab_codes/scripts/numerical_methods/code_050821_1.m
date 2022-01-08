clear; clc; close all;

% Description: Solves an IVP using Explicit Euler Method

dydx = @(x,y) -1.2*y + 7*exp(-0.3*x);

%% Q(b)
ya = @(x,y) 70/9*exp(-0.3*x) - 43/9*exp(-1.2*x);

xStart = 0; xEnd = 2;
h = 0.5;
y0 = 3;
[x,y] = euler_ivp(dydx,[xStart xEnd],y0,h);

figure(1)
plot(x,y,'o','DisplayName','Euler')
xq = linspace(xStart,xEnd,100);
hold on
plot(xq,ya(xq),'DisplayName','Exact')
xlabel('x')
ylabel('y')

legend show

%% Q(c)
% Let C = y(1) and T = y(2)

dydt = @(t,y) [-exp(-10./(y(2)+273))*y(1);
                1000*exp(-10./(y(2)+273))*y(1) - 10*(y(2)-20)];

C0 = 1.0;
T0 = 15;
y0 = [C0 T0];
dt = 0.001;
tStart = 0; tEnd = 1;

[t,y] = euler_ivp(dydt,[tStart tEnd],y0,dt);

figure(2)

yyaxis left
plot(t,y(:,1))
xlabel('x')
ylabel('C [gmol/L]')

yyaxis right
plot(t,y(:,2))
ylabel('T [^oC]')

%% Q(a)
function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end