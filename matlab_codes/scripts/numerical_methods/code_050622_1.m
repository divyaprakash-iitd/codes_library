clear; clc; close all;

% Description: Solves Laplace equation numerically

% Domain
Lx = 4;
Ly = 4;
dx = 1;
dy = 1;
x  = 0:dx:Lx;
y  = 0:dx:Lx;

% Initial conditions
nx = numel(x);
ny = numel(y);
u = zeros(nx,ny);

% Boundary Conditions
u(:,1)      = 0;
u(:,end)    = 8+2*y;
u(1,:)      = 1/2*x.^2;
u(end,:)    = x.^2;

niter = 1000;
for iter = 1:niter
    for i = 2:nx-1
        for j = 2:ny-1
            u(i,j) = 1/4*(u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1));
        end
    end
end

flipud(u)

contourf(u,'edgecolor','none')
colormap(jet)
