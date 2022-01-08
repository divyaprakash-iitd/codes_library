clear; clc; close all;

% Description: Plots the trajectory of a moving particle

g = 9.81;

rho = @(v0,beta,t) v0.^2*(cos(beta)).^2/g.*sqrt((1+(-g.*t/v0/cos(beta)+tan(beta))).^3);

theta = @(t,beta) atan(-g.*t/v0/cos(beta)+tan(beta));

figure(1)
hold on
for v0 = 30:10:70
    for beta = deg2rad(50:10:60)
        t = linspace(0,2*v0*sin(beta)/g);
        plot(t,rho(v0,beta,t),'DisplayName',sprintf('v0 = %.1f; b = %.1f',v0,rad2deg(beta)))
    end
end
legend show
xlabel('\rho')
ylabel('t')
grid on