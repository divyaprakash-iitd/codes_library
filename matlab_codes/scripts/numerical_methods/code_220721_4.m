clear; clc; close all;

% Description: Solves a partial differential equation using finite
% difference method.

x0 = 0; xN = 1;
h = 0.2;
x = x0:h:xN;
nx = numel(x);

t0 = 0; tN = 1;
k = 0.02;
t = t0:k:tN;
nt = numel(t);

u = zeros(nx,nt);

% Initial conditions
u(:,1) = sin(pi*x);

% Boundary conditions
u(1,:) = 0;
u(end,:) = 0;

figure(1)
hold on
xlabel('x')
ylabel('u(x,t)')
for it = 1:nt-1
    for ix = 2:nx-1
        u(ix,it+1) = u(ix,it) + k/h^2*(u(ix-1,it) - 2*u(ix,it) + u(ix+1,it));
    end
    if ismember(t(it+1),[0.2,0.4,0.6,0.8,1])
        plot(x,u(:,it+1),'-o','DisplayName',sprintf('t=%.1f',t(it+1)))
    end
end
legend('location','northeast')