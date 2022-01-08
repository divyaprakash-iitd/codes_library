clear; clc; close all;

% Description: Plots an ellipse with equal segments

np = 4;

% parameters:
a = 4;
b = 1;

fun = @(t) sqrt(a^2.*(sin(t)).^2 + b^2.*(cos(t)).^2);

C = integral(fun,0,2*pi);

dc = C/np;

N = 4;
t = linspace(0,2*pi,N);

l = dc;
x = @(t) a*cos(t);
y = @(t) b*sin(t);

hold on

% plot(x(0),y(0),'kx')
%k = {'x','o','*','^'};
for i = 1:N
    I = integral(fun,0,t(i));
    plot(x(t(i)),y(t(i)),'kx')
    x(t(i))
    y(t(i))
    pause(2)
end


% 
% plot(x(0),y(0),'kx')
% for i = 1:N
%     T = atan2(b,a*tan(t(i)));
%         I = integral(fun,0,T);
%     if I >= l
%         plot(x(T),y(T),'rx')
%         x(T)
%         y(T)
%         l = l + dc
%     end
% end
