clear; clc; close all;

% Description: Solves for the root of an equation using Newton's and
% Bisection method

syms f(x)
f = atan(erfc(x)-x^4);
df = diff(f,x);

f = matlabFunction(f);
df = matlabFunction(df);

a = 0;
b = 2;
x = mean([a,b]);

epsi = 1e-14;
nmax = 1e5; 

tic
[x,~] = newton(f,df,x,nmax,epsi);
tnewton = toc;

tic
[x, ~] = bisection(f,a,b,nmax,epsi);
tbisection = toc;

ans_2a = x;
if tnewton < tbisection
    ans_2b = "Newton";
else 
    ans_2b = "Bisection";
end

function [x,iter] = newton(f,df,x,nmax,epsi)
    err = 1;
	iter = 0;
	while ((iter < nmax) && (err > epsi))
		xold = x - f(x)./df(x);
        err = abs((x-xold)/xold);
        x = xold;
		iter = iter + 1;
	end
end


function [c, iter] = bisection(f,a,b,nmax,epsi)
	c = mean([a,b]);
    err = 1;
	iter = 0;
	while ((iter < nmax) && (err > epsi))
		[a,b] = rootInterval(f,a,b,c);
		cold = mean([a,b]);
        err = abs(c-cold)/abs(cold);
        c = cold;
		iter = iter + 1;
	end
end

function [a,b] = rootInterval(f,a,b,c)
	if f(a)*f(c) < 0
		b = c;
	else
		a = c;
	end
end
