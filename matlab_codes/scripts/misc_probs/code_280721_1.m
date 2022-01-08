clear; clc; close all;

% Description: Make a table of error of Finite Difference Methods and plot
% the results.

f   = @(x) sin(x) - cos(x);
df  = @(x) cos(x) + sin(x);
x = 0;

figure(1)
xlabel('h')
ylabel('Absolute Error')
hold on

fprintf("  h            f'(x)            error\n")
for h   = logspace(-1,-12,12)
    fx = (f(x+h) - f(x-h))/2/h;
    err = fx - df(x);
    fprintf('%2.0e %18.14f %18.14f\n',h,fx,err)
    plot(h,abs(err),'rx')
end
set(gca,'xscale','log')
set(gca,'yscale','log')

