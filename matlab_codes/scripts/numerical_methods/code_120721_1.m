clear; clc; close all;

% Description: Computes the 3 point forward and backward differences.

x = 1:0.1:1.4;
y = [2.1 2 2.2 2.3 2.1];

df = zeros(numel(y),1);

fprintf('Forward Difference\n')
f3 = forward3(x,y)
fprintf('Backward Difference\n')
b3 = backward3(x,y)


function f = forward3(x,y)
    c = [-3/2, 2, -1/2];
    n = numel(x);
    dx = x(2)-x(1);
    f = zeros(1,n);
    for i = 1:n-2
        f(i) = 1/dx*(c(1)*y(i) + c(2)*y(i+1) + c(3)*y(i+2));
    end
end

function f = backward3(x,y)
    c = [3/2, -2, 1/2];
    n = numel(x);
    dx = x(2)-x(1);
    f = zeros(1,n);
    for i = 3:n
        f(i) = 1/dx*(c(1)*y(i) + c(2)*y(i-1) + c(3)*y(i-2));
    end
end