clear; clc; close all;

% Description: Solves a 1D steady state heat transfer problem with internal
% heat generation with insulated and convection boundary conditions.

L       = 15e-2;    % [cm]
e       = 5e5;      % [W/m^3]
Tinf    = 36;       % [C]
k       = 42;       % [W/m/C]
h       = 73;       % [W/m^2/C]
dx      = 3e-2;     % [cm]

N = L/dx + 1;

lamda = 1 + h*dx/k;
A = diag(ones(1,N-1),-1) + diag(-2*ones(1,N),0) + diag(ones(1,N-1),1);
A(1,1) = -1;A(end,end) = -lamda;

b = -e*dx^2/k*ones(N,1);
b(1) = b(1)/2; b(end) = b(end)/2 - h*dx/k*Tinf;

T = A\b;
plot((0:dx:L)*100,T,'-o')
xlabel('x [cm]')
ylabel('T [^oC]')