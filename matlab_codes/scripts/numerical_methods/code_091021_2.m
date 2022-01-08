clear; clc; close all;

% Description: Corrects a given code

x0 = 0;
for n = 0:0.1:10
    x = fzero(@(x) root(x,n),x0)
end

function F = root(x,n)
    y = n + 1;
    F = ((x.^y-1)/(x-1)) - 1 - (n.*(x.^y)-1);
end
