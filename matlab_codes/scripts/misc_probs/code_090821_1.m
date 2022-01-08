clear; clc; close all;

% Description: Solves a Nonhomogeneous Linear Ordinary Differential Equation
% with Constant Coefficients.

m = 2;
c = 8;
k = 80;

syms y(t)
Dy = diff(y);

ode = m*diff(y,t,2) + c*diff(y,t,1) + k*y(t) == 30;
cond1 = y(0) == 0;
cond2 = Dy(0) == 0;

conds = [cond1 cond2];
ySol(t) = dsolve(ode,conds);
ySol = simplify(ySol)

ySolM = matlabFunction(ySol);
dySolM = matlabFunction(diff(ySol,t,1));

syms y(t)
Dy = diff(y);

ode = m*diff(y,t,2) + c*diff(y,t,1) + k*y(t) == 0;
cond1 = y(0) == ySolM(pi/2);
cond2 = Dy(0) == dySolM(pi/2);

conds = [cond1 cond2];
ySol(t) = dsolve(ode,conds);
ySol = simplify(ySol)
