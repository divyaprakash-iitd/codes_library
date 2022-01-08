function [t,y] = euler_ivp(fun,tspan,y0,dt)
% euler_ivp: Solves IVP using Euler's methodSolves IVP using Euler's method
% [t,y] = euler_ivp(fun,t0,y0,tN,dt):
%   Solves a system of differential equations y' = f(t,y) using Euler's Method
%
% input: 
%   fun = fun is a function handle. For a scalar t and a vector y, 
%         fun(t,y) must return a column vector corresponding to f(t,y).
%   tspan   = A vector contining the the start time and end time, [t0 tN].
%   y0  = Intial value of y at t0
%   dt  = Step size
% output:
%   t = Values of t
%   y = Values of y calculated at all t
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 14 July 2021

    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    for i = 1:nt-1
        y(i+1,:) = y(i,:) + fun(t(i),y(i,:))'*dt;
    end
end