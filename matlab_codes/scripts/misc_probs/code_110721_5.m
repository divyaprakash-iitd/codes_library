clear; clc; close all;

h = 0.01; k = 0.0001;

x0 = 0; xN = 1;
t0 = 0; tN = 0.0002;

x = x0:h:xN;
t = t0:k:tN;

nx = numel(x);
nt = numel(t);

u = ones(1,nx);

u(1)        = 0;    % Boundary condition
u(end)      = 0;    % Boundary condition

for it = 1:10
    for ix = 2:nx-1
        u(ix) = u(ix) + k/h^2*(u(ix-1) - 2*u(ix) + u(ix+1)); 
    end
end
