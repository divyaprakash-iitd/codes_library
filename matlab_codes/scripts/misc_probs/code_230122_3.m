clear; clc; close all;

% Description: Solves a heat transfer problem using Crank-Nicolson method

% Input Values
C       = 0.1;
dx      = 0.05; 
dt      = 0.01;
xStart  = 0; 
xEnd    = 1;
TIC     = @(x) 100 + 0*x;
TBC     = [300 300];

figure(1)
xlabel('x [ft]')
ylabel('T [^oF]')
hold on
for t = [0 0.25 0.5 1 2 3 5 10]
    [x,T] = cranknicolsonheat([xStart xEnd],dx,TIC,TBC,C,t,dt);
    plot(x,T,'-*','DisplayName',sprintf('t=%5.2f',t))
end
legend('location','northeastoutside')

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
