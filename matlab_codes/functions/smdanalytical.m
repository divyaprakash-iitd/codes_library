function [x, v] = smdanalytical(m,c,k,f,ic)
% smdanalytical: Solves a spring-mass-damper system 
%[x, dx] = smdanalytical(m,c,k,F,IC):
%   Solves a spring-mass-damper system using the Symbolic toolbox MATLAB.
%
% input: 
%   m    = Mass
%   c    = Damping constant
%   k    = Spring constant
%   ic   = Initial conditions (Initial position and velocity)
% output:
%   x    = Equation for position
%   v    = Equation for velocity
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 29 August 2021

    % Formulate the governing equations
    syms x(t)
    ts  = symvar(f);
    f   = subs(f,ts,t); % Replace the symbolic variable with t
    Dx  = diff(x,t,1);
    ode = m*diff(x,t,2) + c*diff(x,t,1) + k*x == f;

    % Initial conditions
    cond1 = x(0)  == ic(1);
    cond2 = Dx(0) == ic(2);
    conds = [cond1 cond2];
    
    % Solve using dsolve
    xSol(t) = dsolve(ode,conds);
    digits(4) % Number of digits required in equations
    x = vpa(simplify(xSol));
    v = vpa(simplify(diff(xSol)));
end