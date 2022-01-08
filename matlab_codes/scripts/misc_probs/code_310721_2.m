clear; clc; close all;

% Description: Solves and prints the solution to a time dependent PDE.

dt = 0.1; dx = 0.6;
xStart = 0; xEnd = 3;
tStart = 0; tEnd = 0.2;

x = xStart:dx:xEnd;
t = tStart:dt:tEnd;

nx = numel(x);
nt = numel(t);

u = zeros(nx,nt);

% Initial condition
u(:,1) = 2*x.*(3-x);

% Boundary condition
u(1,:) = 0; u(end,:) = 0;

fprintf('t=%.4f\n',t(1))
for ix = 1:nx
 
    fprintf('u(%d,%d) = %10.4f\n',ix-1,0,u(ix,1))
end
fprintf('\n')

for it = 1:nt-1
    fprintf('t=%.4f\n',t(it+1))
    fprintf('u(%d,%d) = %10.4f\n',0,it,u(1,it))
    for ix = 2:nx-1
        u(ix,it+1) = 0.2778*(u(ix-1,it) + u(ix+1,it)) + 0.4444*u(ix,it);
        fprintf('u(%d,%d) = %10.4f\n',ix-1,it,u(ix,it+1))
    end
    fprintf('u(%d,%d) = %10.4f\n',ix,it,u(ix+1,it))
    fprintf('\n')
end