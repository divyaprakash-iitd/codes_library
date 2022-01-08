function [x,u] = cranknicolsonheat(xSpan,dx,uIC,uBC,C,tSim,dt)
% cranknicolsonheat: Solves a 1D transient heat conduction problem with
% Dirichlet boundary conditions using the crank nicolson method
% u = cranknicolsonheat(uIC,uBC,C,xStart,xEnd,dx,tFinal,dt):
%   Solves a one dimensional heat transient heat conduction problem of the
%   form shown below with Dirichlet boundary conditions
%       2
%      d             d
%   C --- u(x, t) = -- u(x, t)
%       2           dt
%     dx
%   
%
% input: 
%   uIC     = An anonymous function describing the initial values at all
%             grid points.
%   uBC     = A vector containing the value of u at the start and end grid
%             point.
%   C       = Value of the constant in the above equation
%   xSpan   = A vector containing the start and end locations.
%   dx      = Spatial step size
%   tSim    = Simulation time
%   dt      = Temporal Step size
% output:
%   x = Values of x
%   u = Values of u calculated at all x at time tSim
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 01 August 2021

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




