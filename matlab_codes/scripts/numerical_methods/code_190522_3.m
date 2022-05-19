clear; clc; close all;

% Description: Solves an ode using RK2

dxdt = @(t,x,theta,Vwind,Awaves) [ x(2);
                1/100*(50*Vwind*cosd(theta) + 6*Awaves*sin(x(1)/10) - 60*x(2))];
tspan = [0,50];
dt = 0.001;
x0 = [0,0];

% Part (A)
Vwind = 14;
Awaves = 3;
theta = 30;
odefun = @(t,x) dxdt(t,x,theta,Vwind,Awaves);
[t,x] = RK2(odefun,tspan,x0,dt);
figure
hold on
plot(t,x(:,2),'DisplayName',sprintf('%c = %d',952,theta))
legend('Location','best')
grid on
xlabel('t')
ylabel('dx/dt')
title('Part (A)')

% Part (B)
Vwind = 14;
theta = 30;
figure
hold on
for Awaves = [0.1,1,6]
    odefun = @(t,x) dxdt(t,x,theta,Vwind,Awaves);
    [t,x] = RK2(odefun,tspan,x0,dt);
    plot(t,x(:,2),'DisplayName',sprintf('A_{Waves} = %.2f',Awaves))
end
legend('Location','best')
grid on
xlabel('t')
ylabel('dx/dt')
title('Part (B)')

% Part (B)
Awaves = 6;
Vwind = 14;
figure
hold on
for theta = [0,10,30,50,90]
    odefun = @(t,x) dxdt(t,x,theta,Vwind,Awaves);
    [t,x] = RK2(odefun,tspan,x0,dt);
    plot(t,x(:,2),'DisplayName',sprintf('%c = %d%c',952,theta,176))
end
legend('Location','best')
grid on
xlabel('t')
ylabel('dx/dt')
title('Part (C)')

function [t,y] = RK2(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        ymid = y(i,:) + fun(t(i),y(i,:))' * dt /2; 
        y(i+1,:) = y(i,:) + fun(t(i)+dt/2,ymid)'*dt;
    end
end