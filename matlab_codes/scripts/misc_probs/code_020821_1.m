clear; clc; close all;

% Description: Solves an IVP using Laplace transform

syms s t Y
k = 32;
f = 0;
F = laplace(f,t,s);
Y1 = s * Y - 10/12;
Y2 = s * Y1 + 5;
Sol = solve(Y2 + k*Y - F, Y);
sol = ilaplace(Sol,s,t);
pretty(sol)
ezplot(sol,[0,10])

hold on
odefun = @(t,y) [y(2); -k*y(1)];

[t,y] = ode45(odefun,[0 10],[10/12 -5]);
plot(t,y(:,1),'o')
