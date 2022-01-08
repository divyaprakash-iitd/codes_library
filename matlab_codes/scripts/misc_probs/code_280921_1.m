clear; clc; close all;

% Description: Solves a projectile problem

% Parameters
y0 = 10;
v0 = 80;
theta = 45;
g = 9.81;

y = @(t) -g/2*t.^2 + v0.*sind(theta).*t + y0;
x = @(t) v0.*cosd(theta).*t;


% Plot ground and hill
H = 1000;
p = polyfit([100 100+H*cosd(45)],[0 H*sind(45)],1);


hold on
plot([0 100],[0 0],'k-','linewidth',2) % Ground

tmp = 200;
t = 0;
dt = 0.05;
while (1)
    if (y(t) > 0)
        if (x(t) > y(t) + 100)
            tmp = x(t);
            break;
        else
            plot(x(t),y(t),'r.')
        end
    elseif (y(t) < 0)
        break;
    end
    t = t + dt;
end
xx = linspace(100,tmp+100,100);
plot(xx,polyval(p,xx) ,'k-','linewidth',2)

plot(x(t),y(t))
xlabel('x')
ylabel('y')

axis equal


