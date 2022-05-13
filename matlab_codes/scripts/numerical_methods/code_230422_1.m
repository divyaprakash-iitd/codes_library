clear; clc; close all;

% Description: Solves an IVP using Euler's and Midpoint method

% Analytical Solution
yan = @(x) exp(-2*x).*(2*exp(x) + exp(4*x) + 1);

xspan = [0,0.6];
hold on
fplot(yan,xspan,'DisplayName','Analytical')

odefun = @(t,y) [   y(2);
                    y(3);
                    -y(3)+4*y(2)+4*y(1)     ];

y0 = [4,-2,10];

% Euler's Method
dx = 0.03;
[t,y] = euler_ivp(odefun,xspan,y0,dx);
plot(t,y(:,1),'*','DisplayName','Euler')

% Midpoint Method
dx = 0.03;
[t,y] = midpoint_ivp(odefun,xspan,y0,dx);
plot(t,y(:,1),'^','DisplayName','Midpoint')

xlabel('x')
ylabel('u')
grid on
legend('Location','North')

function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end

function [t,y] = midpoint_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        ymid = y(i,:) + fun(t(i),y(i,:))' * dt /2; 
        y(i+1,:) = y(i,:) + fun(t(i)+dt/2,ymid)'*dt;
    end
end