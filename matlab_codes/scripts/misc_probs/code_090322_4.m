clear; clc; close all;

% Description: Fits the desired curves to the given data

x = [1 1.8 2.3 3.7 5.6 6.5]';
y = [3 5.7 7 15 36 70]';

% Query points
N = 1000;
xq = linspace(x(1),x(end),N);


eqn1 = 'a*x+b';
eqn2 = 'a*x^2 + b*x + c';
eqn3 = 'a*exp(b*x)';

% Fit the curve
f1 = fit(x,y,eqn1);
f2 = fit(x,y,eqn2);
f3 = fit(x,y,eqn3);

hold on
scatter(x,y,'DisplayName','Data')
plot(xq,f1(xq),'DisplayName',strcat('y=',eqn1))
plot(xq,f2(xq),'DisplayName',strcat('y=',eqn2))
plot(xq,f3(xq),'DisplayName',strcat('y=',eqn3))

xlabel('x')
ylabel('y')
legend('Location','northwest')
grid on
