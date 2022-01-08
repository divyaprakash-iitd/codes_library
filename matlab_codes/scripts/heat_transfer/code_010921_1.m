clear; clc; close all;

% Description: Solves a heat transfer problem with varying thermal conductivity.

L1 = 1/2;
L2 = 1/2;

dt = 0.0011;
dx = 0.1;
x = 0:dx:(L1+L2);
nx = numel(x);
tSim = 10;
t = 0:dt:tSim;
u = zeros(1,nx); % Initial conditions
u(1) = 1; u(end) = 1; % Boundary conditions 
r = 1;
figure(1)
for it = 1:numel(t)
    for i = 2:nx-1
        if i == ceil(nx/2)
            u(i) = 1/12*(4*u(i+1)+4*u(i-1)-u(i+2)-u(i-2));
        end
        if i < ceil(nx/2)
            u(i) = u(i) + dt/dx^2*(u(i+1)-2*u(i)+u(i-1));
        end
        if i > ceil(nx/2)
            u(i) = u(i) + r*dt/dx^2*(u(i+1)-2*u(i)+u(i-1));
        end
    end
    plot(x,u)
    drawnow
end


