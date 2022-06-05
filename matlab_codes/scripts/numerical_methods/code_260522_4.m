clear; clc; close all;

% Description: Plots the Taylor series approximation of a function

f = @(x) log(0.5*x);

fplot(f,[1,5])

fun = 'log(0.5*x)';

x = 1:0.2:5;

% n = 1:5;
no = input('Enter the order of Taylor Series: ');
n = no + 1;

a = 3;
hold on

yval = zeros(size(n));
for j = 1:numel(n)
    for i = 1:numel(x)
        h = -(a - x(i));
        [~, y]= taylor_series(fun,n(j),a,h);
        yval(i) = y;
    end
    plot(x,yval,'-.','DisplayName',sprintf('Order: %d',n(j)-1))
end
grid on
xlabel('x')
ylabel('f(x)')
legend('Location','southeast')

function [y, yVal]= taylor_series(fun,n,x0,h)
    f = str2sym(fun);

    for i = 1:n
        dyN = diff(f,i-1);
        if i == 1
            y = dyN*h^(i-1)/factorial(i-1);
        else 
            y = y + dyN*h^(i-1)/factorial(i-1);
        end
    end
    yVal = feval(matlabFunction(y),x0);
end
