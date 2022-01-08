clear; clc; close all;

% Description: Plots a function

f = @(x) (2*x.^2+4*x-96)./(x.^2+3*x-28);

fplot(f,[-15 15])
set(gca, 'XAxisLocation','origin')
set(gca, 'YAxisLocation','origin')