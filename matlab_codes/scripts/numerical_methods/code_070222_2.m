clear; clc; close all;

% Description: Fits a curve to the given data

i = [1 10:10:100]';
qdot = [0.35 30 125 290 500 850 1000 1500 2100 2600 3000]'*1e-4;

[f, gof] =fit(i,qdot,'poly2')
plot(f,i,qdot)
xlabel('i [A]')
ylabel('qdot [W/m^3]')
dim = [.2 .5 .2 .2];
str = sprintf('r^2 value: %.5f\n',gof.rsquare);
annotation('textbox',dim,'String',str,'FitBoxToText','on');
grid on

iq = 125;
fprintf('Heat generation at i = %d Amps is %e W/m^3\n',iq,f(iq))

d = 0.006;
A = pi*d^2/4;

fitEqn = 'a*x^n';

[f, gof] =fit(i,qdot,fitEqn)

Re = f.a*A^2;

fprintf('Re = %e\n',Re)
fprintf('n = %e\n',f.n)
