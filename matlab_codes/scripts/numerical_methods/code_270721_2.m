clear; clc; close all;

% Description: Finds the step size for truncation error is less than 10^-2.

dy = @(t,y) (y./t) + 1;
yExact = @(t,y) t.*log(t) + 2*t;

tStart = 1; tEnd = 3;
tspan = [tStart tEnd];
y0 = 2;
tol = 1e-2;

dt = fzero(@(dt) residual(dy,yExact,tspan,y0,dt,tol),[0.0001,1]);

t = tspan(1):dt:tspan(2);

yEx = yExact(t);
yEu = euler_ivp(dy,tspan,y0,dt);

figure(1)
hold on
plot(t,yEu,'DisplayName','Euler')
plot(t,yEx,'-.','DisplayName','Exact')
legend('location','northwest')
xlabel('t')
ylabel('y')

figure(2)
plot(t,abs(yEx(:)-yEu(:)))
title(sprintf('Truncation Error for dt = %.4f',dt))
xlabel('t')
ylabel('Truncation Error')
hold on 
plot([tStart tEnd],[tol tol],'--')


function r = residual(dy,yExact,tspan,y0,dt,tol)
    t = tspan(1):dt:tspan(2);
    yEx = yExact(t);
    yEu = euler_ivp(dy,tspan,y0,dt);
    r = max(abs(yEx(:)-yEu(:)));
    r = tol - r;
end

function y = euler_ivp(fun,tspan,y0,dt)
    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end