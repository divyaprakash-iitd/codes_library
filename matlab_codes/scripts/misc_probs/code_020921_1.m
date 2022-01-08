clear; clc; close all;

% Description: Plots lines and column vectors (Linear Algebra) for it's solution.

y1 = @(x) x/2;
y2 = @(x) 6-x;

x = fzero(@(x) y1(x) - y2(x),0);
y = y1(x);
fprintf('Solution: [x,y] = [%d,%d]\n',x,y)
clear; clc; close all;

% Description: Plots lines for it's solution.

y1 = @(x) x/2;
y2 = @(x) 6-x;

x = fzero(@(x) y1(x) - y2(x),0);
y = y1(x);
fprintf('Solution: [x,y] = [%d,%d]\n',x,y)

figure(1)
fplot(y1)
hold on
fplot(y2)
plot(x,y,'ro','DisplayName','Solution')
legend show

c1 = [1 1];
c2 = [-2 1];
rhs = [0 6];
scale = 0;

figure(2)
hold on
quiver(0,0,x*c1(1),x*c1(2),scale)
quiver(0,0,y*c2(1),y*c2(2),scale)
quiver(0,0,rhs(1),rhs(2),scale)
quiver(x*c1(1),x*c1(2),y*c2(1),y*c2(2),scale)
quiver(y*c2(1),y*c2(2),x*c1(1),x*c1(2),scale)


figure(1)
fplot(y1)
hold on
fplot(y2)
plot(x,y,'ro','DisplayName','Solution')
legend show

c1 = [1 1];
c2 = [-2 1];
rhs = [0 6];
scale = 0;

figure(2)
hold on
quiver(0,0,x*c1(1),x*c1(2),scale)
quiver(0,0,y*c2(1),y*c2(2),scale)
quiver(0,0,rhs(1),rhs(2),scale)
quiver(x*c1(1),x*c1(2),y*c2(1),y*c2(2),scale)
quiver(y*c2(1),y*c2(2),x*c1(1),x*c1(2),scale)

