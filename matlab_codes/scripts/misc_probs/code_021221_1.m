clear; clc; close all;

% Description: Fit a curve to the given data

Y = 1790:10:2010;
P = [4.5 6.1 4.3 5.5 7.4 9.8 7.9 10.6 11.2 14.2 17.8 21.5 26.0 29.9 34.7 37.2 42.6 50.6 57.5 64.0 70.3 79.6 87.4];

pfun = @(t) 4.110*exp(0.0144*t);

t = 0:220;

plot(t+1790,pfun(t),'DisplayName','Data')
hold on
plot(Y,P,'o','DisplayName','Model')

xlabel('Year')
ylabel('Population/mi^2')

legend('location','northwest')
grid on


