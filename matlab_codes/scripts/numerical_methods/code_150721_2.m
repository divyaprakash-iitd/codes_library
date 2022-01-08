clear; clc; close all;

% Description: Solves an IVP using ode45 for various initial conditions.

odefun = @(t,y) [y(2); -0.15*y(2)+y(1)-y(1).^3];

dy0 = 0;

figure(1)
hold on
xlabel('t')
ylabel('y')
for y0 = 0.5:0.5:2.5
    [t,y] = ode45(odefun,[0 40],[y0 dy0]);
    plot(t,y(:,1),'DisplayName',sprintf('y(0)=%.1f',y0))
end
legend show