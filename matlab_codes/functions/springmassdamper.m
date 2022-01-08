function [y, omegaN, zeta] = springmassdamper(m,c,k,f)
    omegaN  = sqrt(k/m);
    zeta    = c/2/sqrt(m*k);
    
    F = @(t) f*t;
    
    odefun = @(t,x) [x(2);
                 1/m*(F(t) - c*x(2) - k*x(1))];
    [~,y] = ode45(odefun,[0 10],[0 0]);
    
    if c~=0 
        fprintf('System is damped.\n')
    else
        fprintf('System is undamped.\n')
    end
end