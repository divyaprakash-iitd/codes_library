function [x,n] = fixedPointIter(f,x,tol)
	n = 0;
    max_iter = 1e4;
	while (abs(f(x)) > tol && n < max_iter)
		x = f(x);
		n = n + 1;
    end
    if n == max_iter
        fprintf('The iterative process does not converge!\n')
    end
end 
