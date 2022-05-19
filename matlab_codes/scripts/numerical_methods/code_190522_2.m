clear; clc; close all;

% Description: Solves an ode using Heun's methos and then fits a polynomial
% using linear regression

dydt = @(t,y) 1/sqrt(2*pi) * exp(-t^2/2);

y0 = 0.5;

tend = 0.5;
t = 0:0.1:tend;

y = heun(dydt,t,y0)
plot(t,y,'o')

p = polyfit(t,y,3);
fprintf('\ta3\ta2\ta1\ta0\n')
disp(p)
hold on
tq = linspace(0,tend,100);
plot(tq,polyval(p,tq))
xlabel('X')
ylabel('P(X)')

teval = 0.227;
I = diff(polyval(p,[0,teval]));
fprintf('P(x<=%.4f) = %.4f\n',teval,I)

function y = heun(fun,t,y0)
    dt = t(2)-t(1);
    nt = numel(t);
    y = zeros(1,nt);
    y(1) = y0;

    % Heun's Method
    for i = 1:nt-1
        y0 = y(i) + fun(t(i),y(i))*dt;
        y(i+1) = y(i) + (fun(t(i),y(i))+fun(t(i+1),y0))/2*dt;
    end
end
