clear; clc; close all;

% Description: Fits a curve to the give data

t = 0:2:12;
v = [4 6 16 34 60 94 136];

p = polyfit(t,v,2);
ps = poly2sym(p);

fprintf('The equation for displacement is:\n ')
disp(ps)

tq = 0:0.1:12;
scatter(t,v,'DisplayName','Data')
hold on
plot(tq,polyval(p,tq),'DisplayName','Fit Curve')
legend('Location','best')
grid on
xlabel('t [s]')
ylabel('v [m/s]')

s = matlabFunction(ps);
I = integral(s,t(1),t(end));
a = polyval(polyder(p),2);

fprintf('The distance moved by the particle in %d sec is: %.1f m\n',t(end),I)
fprintf('The acceleration at 2 sec is: %.1f m/s^2\n',a)