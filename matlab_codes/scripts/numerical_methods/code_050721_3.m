clear; clc; close all;

% Description: Solves the IVP problem using Runge-Kutta method and ode45

fun1 = @(t,y) 3*exp(-t) + 0.4*y;
fun2 = @(t,y) -1.95*y + 30;
funcs = {fun1, fun2};

y0 = [5 16];
t0 = 0; tN = 4;
h = [0.01 0.5];

for i = 1:2
    % ode45
    [t,y] = ode45(funcs{i},[t0 tN],y0(i));
    figure(i)
    plot(t,y,'linewidth',2,'DisplayName','ode45')
    
    fprintf(strcat('f=',func2str(funcs{i})));
    fprintf('\ny(1)  = %.4f\n',interp1(t,y,1));
    fprintf('y(1.5)= %.4f\n',interp1(t,y,1.5));
    fprintf('y(3)  = %.4f\n\n',interp1(t,y,3));

    % Runge-Kutta Method
    [t,y] = RK4(funcs{i},t0,tN,h(i),y0(i));
    hold on
    plot(t,y,'--','linewidth',2,'DisplayName','RK4')
    title(func2str(funcs{i}))
    legend('location','north')
end
