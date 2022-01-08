clear; clc; close all;

% Description: Solves for the shape of the cable.

C = 0.041; 
bvpfcn = @(x,y) [y(2); C*sqrt(1+y(2)^2)];

bcfcn = @(ya,yb) [ya(1)-10; yb(1)-15];

guess = @(x) [sin(x); cos(x)];

x0 = 0; xN = 20;
N = 20;
xmesh = linspace(x0,xN,N);
solinit = bvpinit(xmesh, guess);

sol = bvp4c(bvpfcn, bcfcn, solinit);
plot(sol.x, sol.y(1,:), '-o')
xlabel('x [m]')
ylabel('y [m]')