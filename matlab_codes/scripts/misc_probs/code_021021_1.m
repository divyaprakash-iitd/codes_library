clear; clc; close all;

% Description: Solve a BVP using second order forward, central and backward
% finite difference

P = 1;

N = 1000; % Number of Nodes
dx = 2/(N-1); 
x = -1+dx:dx:1-dx;

N = N-2;
k = (P+x.^2).^2/dx.^2;

% Coefficient Matrix
Au = diag(k(2:end).*ones(1,N-1),1);
Am = diag(-2*k-8*x.*ones(1,N));
Al = diag(k(1:end-1).*ones(1,N-1),-1);

A = Au+Am+Al;

A(1,:) = 0;
A(end,:) = 0;

A(1,1) = 2*k(1)-8*x(1)^2;
A(1,2) = -5*k(1);
A(1,3) = 4*k(1);
A(1,4) = -k(1);

A(end,end-3) = -k(end);
A(end,end-2) = 4*k(end);
A(end,end-1) = -5*k(end);
A(end,end) = 2*k(end)-8*x(end)^2;

b = -2*ones(size(x));

AA = zeros(N+2);
AA(2:end-1,2:end-1) = A;
AA(1,1) = 1;
AA(end,end) = 1;


bb = zeros(1,N+2);
bb(2:end-1) = b;
b(1) = 1/(1+P);
b(end) = 1/(1+P);


y = AA\bb';

% Exact Solution
ye = @(x) 1./(P+x.^2);

x = [-1,x,1];
hold on
plot(x,y,'--')
plot(x,ye(x))



