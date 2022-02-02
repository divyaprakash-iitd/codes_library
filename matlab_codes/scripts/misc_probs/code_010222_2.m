clear; close all; clc;

% Description: Plots three curves

phi = 0;

y = @(w,t) exp(-3*t).*cos(w*t + phi) + 2;

t = linspace(0,3,100);
figure(1)
hold on
for w = [0.5,2,6]
    yval = @(t) y(w,t);
    plot(t, yval(t),'LineWidth',2,'DisplayName',sprintf('%c = %.1f',969,w))
end
xlabel('t [sec]')
ylabel('y(t) [m]')
title(sprintf('%c = %.1f',981,0))
grid on
legend show

phi = pi/2;

y = @(w,t) exp(-3*t).*cos(w*t + phi) + 2;

t = linspace(0,3,100);
figure(2)
hold on
for w = [0.5,2,6]
    yval = @(t) y(w,t);
    plot(t, yval(t),'LineWidth',2,'DisplayName',sprintf('%c = %.1f',969,w))
end
xlabel('t [sec]')
ylabel('y(t) [m]')
title(sprintf('%c = %.1f',981,pi/2))
grid on
legend show