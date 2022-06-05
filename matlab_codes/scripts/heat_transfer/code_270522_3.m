clear; clc; close all;

% Description: Solves a 1D transient heat conduction problem

% Input Values
C       = 0.5;
dx      = 0.01; 
dt      = 0.001;
xStart  = 0; 
xEnd    = 1;
uBC     = [100 100];

fun = @(x) 0*x;
figure(1)
xlabel('x')
ylabel('T')
grid on
hold on
for t = 0:0.2:0.8    [x,u] = cranknicolsonheat([xStart xEnd],dx,fun,uBC,C,t,dt);
    T = exactsol(100,C,0:dx:1,t);
    plot(x,T,'-','LineWidth',3,'DisplayName',sprintf('Exact: t=%5.2f',t))
    plot(x,u,'--','LineWidth',3,'DisplayName',sprintf('Numerical: t=%5.2f',t))
end
legend('Location','eastoutside')



function T = exactsol(M,D,x,t)
    T = zeros(size(x));
        for i = 1:numel(x)
            s = 0;
            for m = 1:M
                s = s + 400/(2*m-1)/pi * sin((2*m-1)*pi*x(i)) * exp(-D*(2*m-1)^2*pi^2*t);
            end
            T(i) = 100 - s;
        end
end


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


