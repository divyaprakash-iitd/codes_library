clear; clc; close all;

% Description: Finds roots using Bisection and Newton-Rhapson method

f = @(x) (x+6).^3 -2*exp(x.^2);

N = 5;
a = -7; b = 11;
x = linspace(a,b,N);

% Plot
figure(1)
plot(x,f(x))

a = -7; b = 11;
tol = 1e-8;

figure(2)
hold on
maxiter = 25;
for i = 1:maxiter
    % Bisection method
    [c,errB] = bisection(f,a,b,tol,i);
    plot(i,errB,'k*','HandleVisibility','off')

    % Newton-Rhapson method
    [x,errN] = newtons_diff(f,b,tol,i);
    plot(i,errN,'r^','HandleVisibility','off')
    if (i == maxiter)
        plot(i,errB,'k*','DisplayName','Bisection')
        plot(i,errN,'r^','DisplayName','Newton-Rhapson')
    end
end
set(gca,'YScale', 'log')
xlabel('No. of Iterations')
ylabel('Errors')
title('Convergence Plots')
legend show

function [c, err] = bisection(f,a,b,tol,maxIter)
	c = mean([a,b]);
    err = 1;
	iter = 0;
	while ((iter < maxIter) && (err > tol))
		[a,b] = rootInterval(f,a,b,c);
		cold = mean([a,b]);
        err = abs(c-cold)/abs(cold);
        c = cold;
		iter = iter + 1;
	end
end

function [x,err] = newtons_diff(y,x,tol,maxIter)
    h = 1e-8;
    err = 1;
    iter = 0;
	while ((iter < maxIter) && (err > tol))
        df = (y(x+h) - y(x-h))/2/h;
		xold = x - y(x)./df;
        
        err = abs(x-xold)/abs(xold);
        x = xold;
		iter = iter + 1;
	end
end


