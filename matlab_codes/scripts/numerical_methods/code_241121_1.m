clear; clc; close all;

% Description: Solves a second order differential equation using finite
% difference method

R = 10;
k = 0.25;

rStart = k*R; rEnd = R;
N = 50      ;
dr = (rEnd-rStart)/(N-1);
vStart = 0;
vEnd = 2.5;

r = rStart:dr:rEnd;

% Coefficients
LC = r(2:end-1)/dr^2 - (1./r(2:end-1) + 1)*1/2/dr;
CC = -2*r(2:end-1)/dr^2 - 1./r(2:end-1).^2;
RC = r(2:end-1)/dr^2 + (1./r(2:end-1) + 1)*1/2/dr;

% Pad the arrays
LC = [LC 0];
RC = [0 RC];
CC = [0 CC 0];

% Coefficient matrix
Au = diag(RC.*ones(1,N-1),1);
Am = diag(CC.*ones(1,N),0);
Al = diag(LC.*ones(1,N-1),-1);

A = Au+Am+Al;

A(1,1) = 1;
A(end,end) = 1;

b = zeros(N,1);
b(1) = vStart;
b(end) = vEnd;

vAn = @(r) vEnd*R*(rStart./r - r/rStart)/(k-1/k);

vn = A\b;

plot(r,vAn(r)/10)
hold on
plot(r,vn,'*')