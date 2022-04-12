clear; clc; close all;

% Solves a set of equation using Jacobi method (a)

A = [-3 2 0 0 0;
    1 -3 1 0 0;
    0 1 -3 1 0;
    0 0 1 -3 1;
    0 0 0 2 3];
b = [1 1 1 1 2];
xold = [1 1 1 1 1];
n = size(A,1);

xnew = xold;

% Jacobi method
niter = 20;

for iter = 1:niter
    for i = 1:n
        s = 0;
        for j = 1:n
            if (i~=j)
                s = s + A(i,j)*xold(j);
            end
        end
        xnew(i) = 1/A(i,i) * (b(i) - s);
    end 
    xold = xnew;
end
fprintf('Final Value of x\n')
disp(xnew')