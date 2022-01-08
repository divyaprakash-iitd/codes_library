clear; clc; close all;

% Description: Solves a 1D transient heat conduction problem with Dirichlet
% boundary conditions using the crank nicolson method.

% Input Values
C       = 0.835e-4;
dx      = 2e-2; 
dt      = 0.001;
xStart  = 0; 
xEnd    = 0.1;
uIC     = @(x) 0*x;
uBC     = [100 50];

figure(1)
xlabel('x')
ylabel('u')
hold on
for t = [0 1 5 10 20 30 50]
    [x,u] = cranknicolsonheat([xStart xEnd],dx,uIC,uBC,C,t,dt);
    plot(x,u,'-o','DisplayName',sprintf('t=%5.2f',t))
end
legend show





