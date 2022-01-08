clear; clc; close all;

% Description: Fits a line on a given data set.

x = [ 1250 1562 2060 2295 2400];
y = [136999 149500 195599 244000 252960];

p = polyfit(x,y,1);

xq = linspace(x(1),x(end),1000);

figure(1)
hold on
plot(x,y,'o','DisplayName','Data')
plot(xq,polyval(p,xq),'DisplayName','Fitted Line')
xlabel('x')
ylabel('y')
legend('Location','NorthWest')

fprintf('The equation of the line is:\ny=%.4fx %.4f\n',p(1),p(2))

r = corrcoef(x,y);

fprintf('The correlation coefficient is, r: %.4f\n',r(1,2))

