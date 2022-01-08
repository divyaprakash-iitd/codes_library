clear; clc; close all;

% Description: Solves a 1D transient heat transfer problem

dt = 0.0001;
t= 0:dt:0.1;
nt = numel(t);
ntplot = linspace(1,nt,5);
N = 21;
x = linspace(0,1,N);
dx = x(2)-x(1);

% Initial condition
T = sin(pi*x);
% Boundary condition
T(1) = 0; T(end) = 0;

hold on
for it = 1:nt-1
    for ix = 2:numel(x)-1
        T(ix) = T(ix) + dt*(pi^2-1)*exp(-2*t(it))*sin(pi*x(ix))*(T(ix-1)-2*T(ix)+T(ix+1))/dx^2;
    end
    if any(it==ntplot)
        plot(x,T,'DisplayName',sprintf('t=%.4f',t(it)))
    end
end
legend show
grid on
