clear; clc; close all;

% Description: Solves a heat transfer problem

beta = 167;
Tinf = 300;
N = 10;
L = 0.1;
dx = L/(N-1);
Tleft = 485;
Tright = 300;

Cleft = 1;
Cmid  = -2 - beta*dx^2;
Cright = 1;

A = diag(Cleft*ones(1,N-3),-1) + diag(Cmid*ones(1,N-2),0) + diag(Cright*ones(1,N-3),1);

b = ones(1,N-2)*beta*Tinf*dx^2;
b(1) = b(1) - Tleft;
b(end) = b(end) - Tright;

tol = 1e-6;
maxiter = 6;
Ti = 320;
[T, iter, err] = jacobi(A,b,tol,maxiter,Ti);
T = [Tleft T Tright];
plot(0:dx:L,T,'-o')
xlabel('x [m]')
ylabel('T [k]')
grid on
T

function [x, iter, err] = jacobi(A,b,tol,maxiter,xi)
    iter    = 0;
    err     = 100;
    n       = size(A,1);
    xold    = xi*ones(size(b));
    x       = zeros(size(xold));

    while (iter <= maxiter) && (err > tol)
        for i = 1:n
            s = 0;
            for j = 1:n
                if (i~=j)
                    s = s + A(i,j)*xold(j);
                end
            end
            x(i) = 1/A(i,i) * (b(i) - s);
        end 

        err     = norm(xold-x)/norm(xold);
        xold    = x;
        iter    = iter + 1;
    end
end