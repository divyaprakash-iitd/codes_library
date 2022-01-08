clear; clc; close all;

% Description: Solves a spring mass problem using ode45.

L = 3;
k = 3;
m = 2;

l = @(x) sqrt(L^2+(4-x).^2); 
odefun = @(t,x) [x(2); 1/m*(l(x(1))-L)*k*(L/l(x(1)))];


[t,x] = ode45(odefun,[0 3],[0 0]);

xlabel('Time')
yyaxis left
plot(t,x(:,1))
ylabel('Displacement')

yyaxis right
plot(t,x(:,2))
ylabel('Velocity')

grid on
X = x(:,1);
v = x(:,2);
va = max(v(X<=4));
fprintf('The velocity as the mass passes point A is: %.4f\n',va)

