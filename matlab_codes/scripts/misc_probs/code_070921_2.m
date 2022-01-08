clear; clc; close all;

% Description: Solves a problem using Jacobi and Gauss-Seidel method.

% Jacobi Method
p1 = 0; p2 = 0; p3 = 0;

maxiter = 10000;
tol = 1e-3;
err = 1;
iter = 1;
pold = [p1 p2 p3];

while err > tol && iter < maxiter
    p1Temp = -1/44*(-124-4*p2-4*p3);
    p2Temp = -1/24*(-104-4*p1-8*p3);
    p3Temp = -1/28*(-96-4*p1-8*p2);
    
    p1 = p1Temp; p2 = p2Temp; p3 = p3Temp;
    
    pnew = [p1 p2 p3];
    
    err = norm(pold-pnew);
    pold = pnew;
    iter = iter + 1;
end
fprintf('Jacobi Method\n')
fprintf('Number of Iterations: %d\n',iter)
fprintf('Error: %e (Tolerance: %e)\n',err,tol)
fprintf('Solution\n')
disp(pold)

% Gauss-Seidel Method
p1 = 0; p2 = 0; p3 = 0;

maxiter = 10000;
tol = 1e-3;
err = 1;
iter = 1;
pold = [p1 p2 p3];
while err > tol && iter < maxiter
    p1 = -1/44*(-124-4*p2-4*p3);
    p2 = -1/24*(-104-4*p1-8*p3);
    p3 = -1/28*(-96-4*p1-8*p2);
    pnew = [p1 p2 p3];
    
    err = norm(pold-pnew);
    pold = pnew;
    iter = iter + 1;
end
fprintf('Gauss Seidel Method\n')
fprintf('Number of Iterations: %d\n',iter)
fprintf('Error: %e (Tolerance: %e)\n',err,tol)
fprintf('Solution\n')
disp(pold)