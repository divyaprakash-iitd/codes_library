clear; clc; close all;

% Description: Solves a partial differential equation using finite
% difference method.

x0 = 0; xN = 4;
dx = 0.25;
x = x0:dx:xN;
nx = numel(x);

t0 = 0; tN = 21;
dt = 0.001;
t = t0:dt:tN;
nt = numel(t);

u = zeros(nx,nt);

% Initial conditions
u(:,1) = 0.01;

% Boundary conditions
u(1,:) = 1;

figure(1)
hold on
xlabel('x')
ylabel('u(x,t)')
for it = 1:nt-1
    for ix = 2:nx
        if (ix == nx)
            ug = u(ix-1,it) + 2*(2/u(ix,it)-1)*dx;
            u(ix,it+1) = u(ix,it) + u(ix,it)*dt*(u(ix-1,it)-2*u(ix,it)+ug)/dx^2 - dt*u(ix,it)^2;
        else
            u(ix,it+1) = u(ix,it) + u(ix,it)*dt*(u(ix-1,it)-2*u(ix,it)+u(ix+1,it))/dx^2 - dt*u(ix,it)^2;
        end
    end
    if ismember(t(it),[0.1,2,8,20])
        plot(x,u(:,it),'-o','DisplayName',sprintf('t=%.1f',t(it)))
    end
end
legend('location','north')