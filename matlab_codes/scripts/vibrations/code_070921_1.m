clear; clc; close all;

% Description: Solves a tugboat and barge (IVP) problem using ode23.

m1 = 110e3;
m2 = 2300e3;
k = 3.2e3;
c1 = 11e3;
c2 = 92e3;

odefun = @(t,y) [ y(2);
                  1/m1*(F(t) -c1*y(2)^2-k*(y(1)-y(3)));
                  y(4);
                  1/m2*(-c2*y(4)^2+k*(y(1)-y(3)))];
            
y0 = [0 0 0 0];
tspan = [0 1600];
[t,y] = ode23(odefun,tspan,y0);

figure(1)
yyaxis left
ylabel('Displacement [m]')
plot(t,y(:,1))

yyaxis right
ylabel('Velocity [m/s]')
plot(t,y(:,2))
title('Tug')


figure(2)
yyaxis left
ylabel('Displacement [m]')
plot(t,y(:,3))

yyaxis right
ylabel('Velocity [m/s]')
plot(t,y(:,4))
title('Barge')


function f = F(t)
    if t <= 200
        f = interp1([0 200],[0 10e3],t);
    elseif t > 200 && t <=500
        f = interp1([200 500],[10e3 8e3],t);
    elseif t > 500 && t <=750
        f = interp1([500 750],[8e3 15e3],t);
    elseif t > 750 && t <=900
        f = interp1([750 900],[15e3 0],t);
    elseif t > 900 && t <=1200
        f = interp1([900 1200],[0 30e3],t);
    elseif t > 1200 && t <=1600
        f = interp1([1200 1600],[30e3 0],t);
    end 
end