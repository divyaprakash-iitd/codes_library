clear; clc; close all;

% Description: Solves a SDOF system

% Data
m   = 1.5;
wn  = 32;
k   = wn^2*m;       
c   = 0;  

% Initial Conditions
x0  = 0;%0.004;     
v0  = 0;%0.1536;         
ic  = [x0 v0];
t   = 0:0.0001:2.5;

% Solve numerically and plot
Fo = 24.58;
f = @(t) Fo*(t>=1 && t<=2) + 0;
[x, v] = smdnumerical(m,c,k,f,ic,t);

plot(t,x,'-','DisplayName','Numerical')
xlabel('t')
ylabel('x')
grid on

fprintf('Response after t = %.1f: %.5f\n',t(end),x(end))

function [x, v] = smdnumerical(m,c,k,f,ic,tspan)
    odefun = @(t,x) [x(2); 1/m*(f(t) - c*x(2) - k*x(1))];
    [~,x] = ode45(odefun,tspan,ic);
    v = x(:,2);
    x = x(:,1);
end
