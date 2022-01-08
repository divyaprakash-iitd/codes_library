clear; clc; close all;

% Description: Simulates air craft motion by solving IVPs using Euler's
% method

CD  = 1;
CL  = 1;
S   = 1;
rho = 1;
f   = 1;
u1  = 10;
u2  = 10;
u3  = 10;
g   = 9.81;

odefun = @(t,x) [   x(4)*cos(x(5))*cos(u3);
                    x(4)*sin(x(5))*cos(u3);
                    x(4)*sin(u3);
                    -CD*S*rho*x(4)^2/2/x(6) - g*sin(u3) + u1/x(6);
                    -CL*S*rho*x(4)/2/x(6)*sin(u2);
                    -f];
                
x0 = [10 10 100 10 10 1000];
tspan = [0 100];
dt = 1e-4;

[t,x] = euler_ivp(odefun,tspan,x0,dt);

plot(x(:,1),x(:,2))

function [t,y] = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end
