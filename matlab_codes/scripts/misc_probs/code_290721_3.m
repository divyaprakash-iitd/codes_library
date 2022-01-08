clear; clc; close all;

% Description: Fits a quadratic curve and plots a projectile's path.

% Q(11)
Y = [1973 1980 1987 1993 1997];
M = [26.2 19.2 16.6 18.8 19.5];

p = polyfit(Y,M,2);
Yq = linspace(Y(1),Y(end),100);

figure(1)
scatter(Y,M,'DisplayName','Data')
hold on
plot(Yq,polyval(p,Yq),'DisplayName','Quadratic Fit')
xlabel('Year')
ylabel('Median No. of Leisure Hours/Week')
legend show

fprintf('The quadratic regression equation is: %10.8fx^2 %10.8fx + %10.8f\n',p)

% Q(12)
h = @(t) -14*t.^2 + 504*t;
c = fzero(h,40);
t = linspace(0,c,100);

figure(2)
plot(t,h(t))
xlabel('Time [s]')
ylabel('Height [m]')