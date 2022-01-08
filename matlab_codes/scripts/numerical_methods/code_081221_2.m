clear; clc; close all;

% Description: Solves a PDE using finite difference

nSeg = 1000;
xStart = 0;
xEnd = 1;
dx = (xEnd-xStart)/nSeg;
x = xStart:dx:xEnd;

N = numel(x)-2;

Tstart = 0;
Tend = 1;

% Coefficients
x = x(2:end-1);
LC = 1/dx^2 - 1/2./x.^2/dx;
MC = -2/dx^2 -5./x.^2;
RC = 1/dx^2 + 1/2./x.^2/dx;

Au = diag(RC(1:end-1).*ones(1,N-1),1);
Am = diag(MC.*ones(1,N),0);
Al = diag(LC(2:end).*ones(1,N-1),-1);

A = Au+Am+Al;

b = zeros(N,1);
b(1) = 0;
b(end) = -Tend*(1/dx^2 + 1/2./1^2/dx);

T = A\b;
%T = [Tstart T Tend];
plot(x,T)