function [x, iter, err] = jacobi(A,b,tol,maxiter)
    % Jacobi method
    
    iter    = 0;
    err     = 100;
    n       = size(A,1);
    xold    = zeros(size(b));
    x       = zeros(size(xold));

    while (iter <= maxiter) && (err(end) > tol)
        for i = 1:n
            s = 0;
            for j = 1:n
                if (i~=j)
                    s = s + A(i,j)*xold(j);
                end
            end
            x(i) = 1/A(i,i) * (b(i) - s);
        end 

        err     = norm(xold-x);
        xold    = x;
        iter    = iter + 1;
    end
end