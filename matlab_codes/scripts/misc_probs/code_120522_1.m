clear; clc; close all;

% Description: Solves a given ODE symbolically

% Constants
alpha = 3;
beta = -1;

% Formulate the governing equations
syms u(t)
Du  = diff(u,t,1);
ode = -3*diff(u,t,2) - alpha*diff(u,t,1) + beta*u == 0;

% Initial conditions
ic = [1,1];
cond1 = u(0)  == ic(1);
cond2 = Du(0) == ic(2);
conds = [cond1 cond2];

% Solve using dsolve
uSol(t) = dsolve(ode,conds);
digits(4) % Number of digits required in equations
u = vpa(simplify(uSol));
fplot(u)
legend('Location','northoutside')