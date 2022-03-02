clear; clc; close all;

% Description: Solves a PDE by Crank-Nicolson and Finite Difference Method

uexact = @(x,t) exp(-pi^2*t).*sin(pi*x);

xSpan = [0, 1];
C = 1;
tSim = 0.5;
uIC = @(x) sin(pi*x);
uBC = [0, 0];
dt = 0.01;
dx = 0.01;

% % Using Finite Difference
% x = xSpan(1):dx:xSpan(2);
% u = uIC(x);
% 
% u(1) = uBC(1);
% u(end) = uBC(2);
% 
% tspan = 0:dt:tSim;
% unew = zeros(1,numel(x)-2);
% for j = 1:numel(tspan)
%     for k = 1:1000
%         for i = 2:numel(x)-1
%             u(i) = u(i) + dt/dx^2*(u(i-1)-2*u(i)+u(i+1));
%         end
%     end
% end
% plot(x,u,'*')


[x,u] = cranknicolsonheat(xSpan,dx,uIC,uBC,C,tSim,dt);
hold on
plot(x,u,'o','DisplayName','Crank-Nicolson')

plot(x,uexact(x,tSim),'DisplayName','Exact')
legend show
title(sprintf('t=%.2f',tSim))
xlabel('x')
ylabel('u')
grid on

function [x,u] = cranknicolsonheat(xSpan,dx,uIC,uBC,C,tSim,dt)
    % Grid parameters
    x = xSpan(1):dx:xSpan(2);
    t = 0:dt:tSim;
    Nx = numel(x);
    Nt = numel(t);
    lambda = C*dt/dx^2;

    % Initial Conditions
    u = uIC(x)';

    % Boundary Conditions
    u(1) = uBC(1); u(end) = uBC(2);

    % Interior Nodes
    N = Nx-2; % Number of Unknowns (Dirichlet Boundary conditions on both ends)


    % Coefficient Matrix
    leftCoefficient     = -lambda;
    rightCoefficient    = -lambda;
    centerCoefficient   =  2*(1+lambda);

    Au = diag(rightCoefficient  * ones(1,N-1),   1); % Upper Diagonal
    Al = diag(leftCoefficient   * ones(1,N-1),  -1); % Lower Diagonal
    Ad = diag(centerCoefficient * ones(1,N),     0); % Main Diagonal

    A = Au + Al + Ad;


    % RHS Vector
    b = lambda*u(1:end-2) + 2*(1-lambda)*u(2:end-1) + lambda*u(3:end);

    % Boundary conditions
    b(1)    = 2*lambda*u(1) + 2*(1-lambda)*u(2) + lambda*u(3);
    b(end)  = lambda*u(end-2) + 2*(1-lambda)*u(end-1) + 2*lambda*u(end);

    % Time loop
    for it = 2:Nt
        u(2:end-1) = A\b;
        b       = lambda*u(1:end-2) + 2*(1-lambda)*u(2:end-1) + lambda*u(3:end);
        b(1)    = 2*lambda*u(1) + 2*(1-lambda)*u(2) + lambda*u(3);
        b(end)  = lambda*u(end-2) + 2*(1-lambda)*u(end-1) + 2*lambda*u(end);
    end
end




