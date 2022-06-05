clear; clc; close all;

% Description: Finds the roots using false-position method

% f = @(x) exp(x) + 2.^(-x) + 2*cos(x) - 6;
f = @(x) sin(x) -2*x + 3;

fplot(f,[-4,4])
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')

a = 0; b = 0;
while true
    a = input('Enter the first initial value: ');
    b = input('Enter the second initial value: ');
    if f(a) * f(b) > 0
        fprintf('The entered values are not acceptable\n')
    else
        break;
    end
end
tol = input('Enter the stopping criteria (tolerance): ');

[c,iter] = falsePosition(f,a,b,tol);
hold on
plot(c,f(c),'ro')
fprintf('The root is: %.4f\n',c)

function [c,iter] = falsePosition(f,a,b,tol)
	iter = 0;
	c = (a*f(b) - b*f(a))/(f(b)-f(a));
	while abs(f(c)) > tol
		[a,b] = rootInterval(f,a,b,c);
		c = (a*f(b) - b*f(a))/(f(b)-f(a));
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