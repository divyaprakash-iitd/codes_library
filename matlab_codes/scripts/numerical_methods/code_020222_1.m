clear; clc; close all;

% Description: Calculates the root of a given function using bisection
% method

f = @(x) 2*x.*cos(2*x) - (x-2).^2;
fplot(f);
set(gca,'XAxisLocation','origin')
set(gca,'YAxisLocation','origin')
xlim([0 4])
ylim([-5 5])
xlabel('x')
ylabel('f(x)')
grid on

c = bisection(f,[2,3],1e-6);
hold on
plot(c,f(c),'rx')
fprintf('Root: %.4f\n',c)

c = bisection(f,[3,4],1e-6);
plot(c,f(c),'rx')
fprintf('Root: %.4f\n',c)

function c= bisection(f,interval,es)
    a = interval(1);
    b = interval(2);
    if f(a)*f(b) >= 0
        error('Use a bracketing interval')
    end
	c = mean([a,b]);
    err = 1;
	while err > es
		if f(a)*f(c) < 0
		    b = c;
	    else
		    a = c;
	    end
		c = mean([a,b]);
        err = abs(c-b);
    end
end



