clear; clc; close all;

% Description: Plots a log function

y = @(x) -log(4-x) / log(3)-1;

fplot(y,[-8, 8])
set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
ylim([-8,8])
grid on
xlabel('x')
ylabel('y')
grid(gca,'minor')