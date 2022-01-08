clear; clc; close all;

%% Given data
yExact = @(x) exp(-2*x)/4.*(x.^4+4);

y0 = 1;
N = 100;
xSpan = linspace(0,1,N);

%% UNCOMMENT THE QUESTION YOU WANT TO SOLVE

%% Q(1): Using ode45 with local function
% [x,y] = ode45(@odefun,xSpan,y0);
% 
%% Q(2): Using ode45 with calling local function as Anonymous function
% fun = @(x,y) odefun(x,y);
% [x,y] = ode45(fun,xSpan,y0);

%% Q(3): Using ode45 with Anonymous function only
fun = @(x,y) -2*y + x.^3*exp(-2*x);
[x,y] = ode45(fun,xSpan,y0);

%% Plot the figure and tabulate the values
hold on
plot(x,y,'linewidth',2,'DisplayName','ode45')
plot(xSpan,yExact(xSpan),'--','linewidth',2,'DisplayName','Exact')
xlabel('x')
ylabel('y')
legend show

% Print table
title('ODE Initial Value Problem')
fprintf('  x       yexact    yode45\n')
fprintf('--------------------------\n')
for i = 1:N
    fprintf('%.4f    %.4f    %.4f\n',x(i),yExact(x(i)),y(i));
end

%% Local function
function f = odefun(x,y)
    f = -2*y + x.^3*exp(-2*x);
end