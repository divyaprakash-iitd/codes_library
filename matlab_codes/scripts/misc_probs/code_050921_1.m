clear; clc; close all;

% Description: Plots and for loops

% (c)

F = @(x) x.^6 + 4*x.^4 + 2*x - 3;

xBefore = linspace(-8,7,1000);

plot(xBefore,F(xBefore))

% (d)

xBefore = [1.92 0.05 -2.43 -0.02 0.09 0.85 -0.06]'
xAfter = zeros(size(xBefore));

j = 1;
for i = 1:numel(xBefore)
    if (xBefore(i) < -0.1 || xBefore(i) > 0.1)
        xAfter(j) = xBefore(i);
        j = j + 1;
    end
end
xAfter