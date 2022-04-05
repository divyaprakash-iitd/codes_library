clear; clc; close all;
% Description: Solves a PDE using the crank nicolson method.
% Input Values

C       = 1;
dx      = 0.01; 
dt      = 0.01;
xStart  = -1; 
xEnd    = 1;
PIC     = @(x) exp(1-1./(1-x.^2));
PBC     = [0,0];

tSim = 1;
xSpan = [xStart,xEnd];


% Grid parameters
x = xSpan(1):dx:xSpan(2);
t = 0:dt:tSim;
Nx = numel(x);
Nt = numel(t);
lambda = C*dt/dx^2;

% Initial Conditions
P = PIC(x)';

% Boundary Conditions
P(1) = PBC(1); P(end) = PBC(2);

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
A8 = A;

% RHS Vector
b = lambda*P(1:end-2) + 2*(1-lambda)*P(2:end-1) + lambda*P(3:end);

% Boundary conditions
b(1)    = 2*lambda*P(1) + 2*(1-lambda)*P(2) + lambda*P(3);
b(end)  = lambda*P(end-2) + 2*(1-lambda)*P(end-1) + 2*lambda*P(end);

hold on
xlabel('t')
ylabel('P(x=0.5)')
% Time loop
for it = 2:Nt
    P(2:end-1) = A\b;
    b       = lambda*P(1:end-2) + 2*(1-lambda)*P(2:end-1) + lambda*P(3:end);
    b(1)    = 2*lambda*P(1) + 2*(1-lambda)*P(2) + lambda*P(3);
    b(end)  = lambda*P(end-2) + 2*(1-lambda)*P(end-1) + 2*lambda*P(end);
    if (it==2)
        A9 = b;
    end
    plot(t(it),P(x==0.5),'rx');
end
A11 = P(x==0.5);
A10 = b;
A12 = 0;