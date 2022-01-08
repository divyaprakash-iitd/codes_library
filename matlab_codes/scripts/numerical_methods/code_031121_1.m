clear; clc; close all;

% Description: Solves a boundary value problem using finite difference
% method

xStart = 0; xEnd = 2;
dx = 0.1;
uStart = 10;
uEnd = 1;

x = xStart:dx:xEnd;
N = numel(x);

% Coefficients
L = (1/dx^2-3.5/dx);
C = -3;
R = (1/dx^2+3.5/dx);

% Coefficient matrix
Au = diag(R*ones(1,N-1),1);
Am = diag(C*ones(1,N),0);
Al = diag(L*ones(1,N-1),-1);

A = Au+Am+Al;

A(1,:) = 0;
A(end,:) = 0;
A(1,1) = 1;
A(end,end) = 1;

b = 2*ones(N,1);
b(1) = uStart;
b(end) = uEnd;


u = A\b;

plot(x,u)




