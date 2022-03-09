clear; clc; close all;

% Description: Solves forced damped motion using ode45
w = 3;
lamda = 1/36;
f0 = 3;
wf = 1;

y0 = [0 0];
tspan = [0 20];
ode = @(b,t,y) [ y(2);
                  f0*sin(wf*t) - 2*lamda*w*y(2) - w^2*y(1)*(1+b*y(1)^2)];

figure(1)
hold on
for b = 0.25:-0.25:-0.25
    odefun = @(t,y) ode(b,t,y);
    [t,y] = ode45(odefun,tspan,y0);
    plot(t,y(:,1),'DisplayName',sprintf('b = %.2f',b))
end
xlabel('t')
ylabel('y')
grid on
legend show

