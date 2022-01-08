clear; clc; close all;

% Description: Fits a second order polynomial using Least Squares Method

x = [1 3 6 7 9];
y = [3 4 8 11 13];
N = 2;

C = curve_fit_LSM(x,y,N);

fprintf('a2: %.4f\na1: %.4f\na0: %.4f\n',C(1),C(2),C(3))

figure(1)
hold on
plot(x,y,'o','DisplayName','Data')
xq = linspace(x(1),x(end),100); % Query points for smooth plot
plot(xq,polyval(C,xq),'DisplayName','Fit Curve')
legend('location','best')

