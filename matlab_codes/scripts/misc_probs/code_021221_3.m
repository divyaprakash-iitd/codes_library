clear; clc; close all;

% Description: Fit a cubic spline on a given dataset.

% Make a random data set
X = 1900:10:2014;
Y = [1293697 1549008 1823779 1950961 1931334 2071605 2002512 1948609 1688210 1585577 1517550 1526006 1560297];
% Make a cubic spline
f = cubic_spline(X, Y);

plot(X,Y,'o')
hold on
plot(X,f)

function f = cubic_spline(x, y)

    N = length(x);
    delta = abs(x(1)-x(2));
    for i=1:1:N
        if i==1
            A(1,1) = 1;
            B(1) = 0;
        elseif i==N
            A(N, N) = 1;
            B(N) = 0;
        else
            A(i,i-1) = 1/6;
            A(i,i) = 2/3;
            A(i,i+1) = 1/6;
            B(i) = (y(i+1)-2*y(i)+y(i-1))/(delta^2);
        end
    end
            
    %solve matrix
    G = A\(B');
    
    % Create function
    j = @(yy) min(floor((yy - min(x))/(x(2) - x(1))) + 1, length(x)-1);
    fun = @(xx) (G(j(xx))/6)*(((x(j(xx)+1)-xx)^3)/delta-delta*(x(j(xx)+1)-xx)) ...
        + (G(j(xx)+1)/6)*(((xx-x(j(xx)))^3)/delta-delta*(xx-x(j(xx)))) ...
        + y(j(xx))*(x(j(xx)+1)-xx)/delta + y(j(xx)+1)*(xx-x(j(xx)))/delta;
    for i = 1:numel(x)
       f(i)= fun(x(i)); 
    end
end