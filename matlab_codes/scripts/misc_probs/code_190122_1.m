clear; clc; close all;

% Description: Plots a curve to identify regions of interest

f = @(x) 2*x.^3 - 12*x.^2 + 4*x - 27;

fplot(f,[-10 10],'DisplayName','f')
set(gca, 'XAxisLocation','origin')
set(gca, 'YAxisLocation','origin')
ylim([-200 200])

syms x
f = 2*x^3 - 12*x^2 + 4*x - 27;
df = diff(f);
ddf = diff(df);
f = matlabFunction(f);
df = matlabFunction(df);
ddf = matlabFunction(ddf);

xticks(-5:1:5)
xlim([-5,5])
hold on
fplot(df,[-10 10],'DisplayName','df/dx')
fplot(ddf,[-10 10],'DisplayName','d^2f/dx^2')
% legend("f,df/dx'',d^2f/dx^2'''")
legend('location','southeast')
grid on
xlabel('x')
