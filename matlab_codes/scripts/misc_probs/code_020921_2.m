clear; clc; close all;

% Description: Plots lines and column vectors (Linear Algebra) for it's solution.

y1 = @(x) 1/3*(1-2*x);
y2 = @(x) 1/9*(11-10*x);

x = fzero(@(x) y1(x) - y2(x),0);
y = y1(x);
fprintf('Solution: [x,y] = [%.2f,%.2f]\n',x,y)

figure(1)
fplot(y1)
hold on
fplot(y2)
plot(x,y,'ro','DisplayName','Solution')
legend show

c1 = [2 10];
c2 = [3 9];
rhs = [1 11];
scale = 0;

figure(2)
hold on
quiver(0,0,x*c1(1),x*c1(2),scale)
quiver(0,0,y*c2(1),y*c2(2),scale)
quiver(0,0,rhs(1),rhs(2),scale)
quiver(x*c1(1),x*c1(2),y*c2(1),y*c2(2),scale)
quiver(y*c2(1),y*c2(2),x*c1(1),x*c1(2),scale)

