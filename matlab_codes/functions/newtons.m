function [x,iter] = newtons(f,df,x,tol,maxIter)
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		xold = x - f(x)./df(x);
        err = abs(x-xold)/xold;
        x = xold;
		iter = iter + 1;
	end
end