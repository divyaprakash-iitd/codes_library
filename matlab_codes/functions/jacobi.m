function [x, iter, err] = jacobi(A,b,tol,maxiter)
% jacobi: Solves a system of equations using the Jacobi method
% [x, iter, err] = jacobi(A,b,tol,maxiter):
%   Solves the given system of linear equations in the form Ax = b, using
%   the Jacobi method
%   https://en.wikipedia.org/wiki/Jacobi_method
%
% input: 
%   A       = Coefficient matrix
%   b       = RHS vector
%   tol     = Error to tolerance
%   maxiter = Maximum number of iterations
% output:
%   x       = Solution vector
%   iter    = Number of iterations required for convergence
%   err     = Relative error [norm(xold-x)/norm(xold)]
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 13 April 2022

    
    iter    = 0;
    err     = 100;
    n       = size(A,1);
    xold    = zeros(size(b));
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