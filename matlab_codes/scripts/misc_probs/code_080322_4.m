clear; clc; close all;

% Description: Solves a PDE using finite difference method

alpha = 1;
beta = 3;
e = [0.3 0.1 0.05 0.01];
f = -1;

ufun = @(e,x) alpha + x + (beta - alpha - 1) .* ((exp(x/e)-1)./(exp(1/e)-1));

N = 1000;
x = linspace(0,1,N);
xq = x;

% Analytical Solution
figure(1)
subplot(2,2,1)
hold on
for i = 1:numel(e)
    plot(x,ufun(e(i),x))
end

% Finite Difference Solution

H = [1/10 1/25 1/100];
for i = 1:numel(H)
    h = H(i);
    e = 0.01;
    A = e/h^2 + 1/h;
    B = -2*e/h^2;
    C = e/h^2 - 1/h;
    
    x       = 0:h:1;
    N       = numel(x);
    u       = zeros(1,N);
    u(1)    = alpha;
    u(end)  = beta;
    
    Nu = N-2;
    Md = diag(B*ones(1,Nu),0);
    Ml = diag(A*ones(1,Nu-1),-1);
    Mu = diag(C*ones(1,Nu-1),1);
    
    M = Ml + Md +  Mu;
    
    b       = f*ones(1,Nu);
    b(1)    = b(1) - A*u(1);
    b(end)  = b(end) - C*u(end);
    
    u(2:end-1) = M\b';
    
    subplot(2,2,i+1)
    hold on
    plot(x,u)
    plot(xq,ufun(e,xq))
end

