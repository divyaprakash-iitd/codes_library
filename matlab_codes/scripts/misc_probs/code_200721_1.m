clear; clc; close all;

% Description: Solves a Nonhomogeneous Linear Ordinary Differential Equation
% with Constant Coefficients.

syms u(t) w
Du = diff(u);

ode = diff(u,t,2) + u == 3*cos(w*t);
cond1 = u(0) == 0;
cond2 = Du(0) == 0;

conds = [cond1 cond2];
uSol(t) = dsolve(ode,conds);
uSol = simplify(uSol);

u = matlabFunction(uSol(t));

t = linspace(0,15,1000);

figure(1)
hold on
xlabel('t')
ylabel('u(t)')
for w = 0.5:0.1:0.9
    plot(t,u(t,w),'DisplayName',sprintf('\x3c9=%.2f',w))
end
legend('location','best')


figure(2)
hold on
xlabel('t')
ylabel('u(t)')
for w = 0.999
    plot(t,u(t,w),'DisplayName',sprintf('\x3c9=%.2f',w))
end
legend('location','best')

t = linspace(0,200,1000);

figure(3)
hold on
xlabel('t')
ylabel('u(t)')
for w = [0.9, 0.999]
    plot(t,u(t,w),'DisplayName',sprintf('\x3c9=%.2f',w))
end
legend('location','best')