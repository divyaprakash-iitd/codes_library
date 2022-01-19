clear; clc; close all;

% Description: Solves a PDE numerically
% uxx + 2uyy = 0

% Initial conditions
u = zeros(5,5);

% Boundary conditions
% Left
u(1,1) = 0;
u(1,2) = 1000;
u(1,3) = 2000;
u(1,4) = 1000;
u(1,5) = 0;
% Right
u(end,1) = 0;
u(end,2) = 1000;
u(end,3) = 2000;
u(end,4) = 1000;
u(end,5) = 0;
% Top
u(2,end) = 500;
u(3,end) = 1000;
u(4,end) = 500;
% Bottom
% Top
u(2,1) = 500;
u(3,1) = 1000;
u(4,1) = 500;

maxiter = 1000;
for iter = 1:maxiter
    for i = 2:4
        for j = 2:4
            u(i,j) = 1/6*(u(i-1,j)+u(i+1,j)+2*(u(i,j-1)+u(i,j+1)));
        end
    end
end

contourf(u',100,'edgecolor','none')
colormap(jet)
colorbar