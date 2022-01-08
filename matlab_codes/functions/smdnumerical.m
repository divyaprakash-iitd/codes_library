function [x, v] = smdnumerical(m,c,k,f,ic,tspan)
    % ODE
    odefun = @(t,x) [x(2); 1/m*(f(t) - c*x(2) - k*x(1))];
    [~,x] = ode45(odefun,tspan,ic);
    v = x(:,2);
    x = x(:,1);
end