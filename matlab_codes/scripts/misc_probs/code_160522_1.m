clear; clc; close all;

% Description: Plots a vector field

x = [0,-3,4];
y = [0,2,-1];

fx = @(x) 2-x;
fy = @(y) y;

hold on
plot(x,y,'o')

quiver(x,y,fx(x),fy(y),0)
grid on
xlabel('x')
ylabel('y')
xticks(-5:1:5)
xlim([-5,5])
ylim([-5,5])
axis equal

dim = [0.6,0.5,0.1,0.1];
a = annotation('textbox',dim,'String','y = x ');