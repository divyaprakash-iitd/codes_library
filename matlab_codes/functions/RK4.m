function [t,y] = RK4(fun,tspan,y0,dt)
% RK4: Solves IVP using using Runge-Kutta Method
% [t,y] = RK4(fun,tspan,y0,dt):
%   Solves the given IVP using Runge-Kutta fourth order method
%   https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods
%
% input: 
%   fun     = fun is a function handle. For a scalar t and a vector y, 
%             fun(t,y) must return a column vector corresponding to f(t,y).
%   tspan   = A vector contining the the start time and end time, [t0 tN].
%   y0      = Intial value of y at t0
%   dt      = Step size
% output:
%   t = Values of t
%   y = Values of y calculated at all t
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 24 July 2021


    t           = tspan(1):dt:tspan(2);
    nt          = numel(t);
    y           = zeros(nt, numel(y0));
    y(1,:)      = y0;
    
    
    for i = 1:nt-1
        k1 = fun(t(i),y(i,:))';
        k2 = fun(t(i)+dt/2, y(i,:)+dt*k1/2)';
        k3 = fun(t(i)+dt/2, y(i,:)+dt*k2/2)';
        k4 = fun(t(i)+dt,y(i,:)+dt*k3)';
        
        y(i+1,:) = y(i,:) + 1/6*dt*(k1 + 2*k2 + 2*k3 + k4);
    end
end