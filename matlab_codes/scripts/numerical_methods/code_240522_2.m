clear; clc; close all;

% Description: Solves the given set of equations in matrix form using
% Runge-Kutta method

U = 1;
nu = 0.025;
Nx = 6;
N = Nx-1;
dx = 1/(Nx-1);

A = diag(ones(1,N-1),1) + diag(-1*ones(1,N-1),-1);
A(end,end) = 2;
A(end,end-1) = -2;

B = diag(ones(1,N-1),1) + diag(-2*ones(1,N),0) + diag(ones(1,N-1),-1);
B(end,end) = 1;
B(end,end-1) = -2;
B(end,end-2) = 1;

Ldash =  -U/2/dx *  A + nu/dx^2 * B;

P = zeros(N,1);
P(1) = U/2/dx + nu/dx^2;

tspan = [0,15];
dt = 0.1;
phi0 = zeros(N,1);
t           = tspan(1):dt:tspan(2);
nt          = numel(t);
phi           = zeros(nt, numel(phi0));
phi(1,:)      = phi0;

for i = 1:nt-1
    phimid = phi(i,:)'       + dt /2 * (Ldash * phi(i,:)' + P); 
    phi(i+1,:) = phi(i,:)'   + dt    * (Ldash * phimid + P);
end

hold on

for i = 1:size(phi,1)
%     if any(t(i) == [0 5 10 15]) 
        plot(phi(i,:))
%     end
end