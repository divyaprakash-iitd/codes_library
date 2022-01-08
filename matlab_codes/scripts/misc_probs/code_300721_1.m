clear; clc; close all;

% Description: Solve a spring-mass-damper system.

m       = 1;    % [kg]
k       = 100;  % [N/m]
b    = 12;   % [kg/s]


% Solve Analytically
syms x(t)
Dx = diff(x,t,1);
ode = m*diff(x,t,2) + b*diff(x,t,1) + k*x == 5*dirac(t-5) - 4*dirac(t-7);

cond1 = x(0)  == 0;
cond2 = Dx(0) == 1;

conds = [cond1 cond2];
xSol(t) = dsolve(ode,conds);
pretty(xSol)
xSol = simplify(xSol);

t = 0:0.01:2;
xSol = matlabFunction(xSol);
plot(t,xSol(t),'DisplayName','Analytical Solution')

% Solve Numerically
odefun = @(t,x) [x(2);
                 1/m*(5*dirac(t-5) - 4*dirac(t-7) - b*x(2) - k*x(1))];

[t,y] = ode45(odefun,[0 2],[0 1]);
hold on
plot(t,y(:,1),'o','DisplayName','Numerical Solution')
xlabel('t')
ylabel('x')
legend show

