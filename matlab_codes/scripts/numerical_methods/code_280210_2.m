clear; clc; close all;

% Description: Numerically solves a pendulum system

m = 10;
L = 1;
g = 9.8;

Theta0 = deg2rad(179);
dTheta0 = 0;

tStart = 0; tEnd = 10;
nt = 100;

t = linspace(tStart,tEnd,nt);
dt = t(2)-t(1);

Theta = zeros(size(t));
dTheta = zeros(size(t));

Theta(1) = Theta0;
dTheta(1) = dTheta0;

for i = 1:nt-1
    dTheta(i+1) = dTheta(i) - dt*g/L*sin(Theta(i));
    Theta(i+1)  = dTheta(i)*dt + Theta(i);
end

hold on

yyaxis left
plot(t,Theta)
xlabel('t')
ylabel('\theta')

yyaxis right
plot(t,dTheta)
ylabel('$\dot{\theta}$','Interpreter','Latex')