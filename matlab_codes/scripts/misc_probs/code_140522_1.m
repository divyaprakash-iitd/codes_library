clear; clc; close all;

% Description: Plots the shape of an egg and calculates its volume

a = 2;
b = 1.2;
c = 0.25;

fprintf('a = %.2f\n',a)
fprintf('b = %.2f\n',b)
fprintf('c = %.2f\n',c)

y = @(x) sqrt((1-x.^2/a^2)./exp(c*x)*b^2); 

N = 1000;
x = linspace(-a,a,N);

% Plot the egg
hold on
plot(x,y(x),'r')
plot(x,-y(x),'r')
axis equal

set(gca,'xaxislocation','origin')
set(gca,'yaxislocation','origin')
grid on

fprintf('Maximum thickness of the egg is: %.4f\n',2*max(y(x)))
V = pi*integral(@(x) y(x).^2,-b,b);
fprintf('Volume of egg: %.4f\n',V)