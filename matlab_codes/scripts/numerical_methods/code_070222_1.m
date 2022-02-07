clear; clc; close all;

% Description: Solves a mixed boundary Poisson equation problem

dx      = 2*pi/100;
xall    = 0:dx:2*pi;
x       = xall(2:end);
N       = numel(x);

u = zeros(size(xall));
u(1) = 2;

Au = diag(ones(1,N-1),1);
Am = diag(-2*ones(1,N),0);
Al = diag(ones(1,N-1),-1);

A = Au + Am + Al;

A(end,end-1) = 2;

b = dx^2*(-2*cos(x) + x.*sin(x))';

b(1) = b(1) - u(1);
b(end) = b(end) - 4*pi*dx;

uu = A\b;

u(2:end) = uu;

plot(xall,u);
xticks([0 0.25*pi 0.5*pi 0.75*pi pi 1.25*pi 1.5*pi 1.75*pi 2*pi])
xticklabels({'0', '0.25\pi','0.5\pi','0.75\pi','\pi','1.25\pi','1.5\pi','1.75\pi','2\pi'})
grid on
xlabel('x')
ylabel('u(x)')
