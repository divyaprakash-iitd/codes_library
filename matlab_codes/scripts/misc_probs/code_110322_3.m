clear; clc; close all;

% Description: Solves forced damped motion using ode45
w = 3;
lamda = 1/36;
f0 = 3;
wf = [1, 2.9];

y0 = [0 0];
tspan = [0 20];
ode = @(wf,b,t,y) [ y(2);
                  f0*sin(wf*t) - 2*lamda*w*y(2) - w^2*y(1)*(1+b*y(1)^2)];
for j = 1:numel(wf)
    figure(j)
    hold on
    for b = 0.25:-0.25:-0.25
        odefun = @(t,y) ode(wf(j),b,t,y);
        [t,y] = ode45(odefun,tspan,y0);
        plot(t,y(:,1),'DisplayName',sprintf('b = %.2f',b))
    end
    xlabel('t')
    ylabel('y')
    grid on
    title(sprintf('wf = %.1f',wf(j)))
    legend show
end

