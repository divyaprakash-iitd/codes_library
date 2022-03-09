clear; clc; close all;

% Description: This script is for testing concepts

dx  = 0.01;
x   = 0:dx:1;
nx  = numel(x);

N = 1000;
nud = 0.0001;
t = 10;

u = zeros(1,nx);

for ix = 1:nx
    s = 0;
    for n = 1:N
        s = s + sin(pi*n/2)*sin(pi*n*x(ix))*exp(-pi^2*n^2*nud*t);
    end
    u(ix) = 2*s;
end

plot(x,u)