clear; clc; close all;

% Solves a set of equation using Jacobi method (c)

A = [-3 2 0 0 0;
    1 -3 1 0 0;
    0 1 -3 1 0;
    0 0 1 -3 1;
    0 0 0 2 3];
b = [1 1 1 1 2];
xold = [1 1 1 1 1];
n = size(A,1);
xnew = zeros(size(xold));

% Jacobi method
niter = 20;
tol = 1e-8;
iter = 0;
normv = 100;
while normv(end) > tol
    for i = 1:n
        s = 0;
        for j = 1:n
            if (i~=j)
                s = s + A(i,j)*xold(j);
            end
        end
        xnew(i) = 1/A(i,i) * (b(i) - s);
    end 
    normv = [normv, norm(xold-xnew)];
    xold = xnew;
    iter = iter + 1;
end
fprintf('Jacobi method converged after %d iterations\n', iter)

normv = normv(2:end); % Remove the first element
semilogy(1:iter,normv,'-*')
grid on
xlabel("No. of iterations")
ylabel('$${||\vec{\delta}||}$$','Interpreter','latex')
