clear; clc; close all;

% Description: Solves a spring mass damper system

m = 5;
k = 3;
c = 4;
f = 2;

[y, omegaN, zeta] = springmassdamper(m,c,k,f);

yyaxis left
plot(y(:,1))
ylabel('y')

yyaxis right
plot(y(:,2))
grid on
ylabel('dy/dt')
