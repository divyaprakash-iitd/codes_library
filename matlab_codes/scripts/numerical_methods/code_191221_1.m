clear; clc; close all;

% Description: Solves a spring mass damper problem with ode45

m = 1;
k = 100;
b = 1;

f = @(t) 1;

ic = [0,0];
nt = 1000;
tspan = linspace(0,10,nt);

[x, v] = smdnumerical(m,b,k,f,ic,tspan);

yyaxis left
plot(tspan,x)
xlabel('Time [s]')
ylabel('Displacement [m]')

yyaxis right
plot(tspan,v)
ylabel('Velocity [m/s]')
grid on

function [x, v] = smdnumerical(m,c,k,f,ic,tspan)
    % ODE
    odefun = @(t,x) [x(2); 1/m*(f(t) - c*x(2) - k*x(1))];
    [~,x] = ode45(odefun,tspan,ic);
    v = x(:,2);
    x = x(:,1);
end