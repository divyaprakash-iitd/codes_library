clear; clc; close all;

% Description: Plots asymptotes

f = @(x) (0.5*x.^3-x.^2)./(x.^2-3.75*x-20);
e = 1e-3;
N = 100;
x1 = -2.9743;
x2 = 6.7243;

hold on
x = linspace(-15,x1-e,N);
plot(x,f(x),'r-.','DisplayName','Part: 1')
x = linspace(x1+e,x2-e,N);
plot(x,f(x),'k-','DisplayName','Part: 2')
x = linspace(x2+e,15,N);
plot(x,f(x),'b--','DisplayName','Part: 3')

set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
ylim([-20 20])
xlabel('x')
ylabel('y')
grid on
title('Aysmptotes')
legend('location','northwest')