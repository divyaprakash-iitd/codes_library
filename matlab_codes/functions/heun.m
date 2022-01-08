function y = heun(fun,t,y0)
% heun: Solves IVP using Heun's method
% y = heun(fun,t,y0):
%   Solves the given IVP using Heun's method (improved/modified Euler's Method)
%   https://en.wikipedia.org/wiki/Heun%27s_method
%
% input: 
%   fun = An anonymous function describing y'(t) = f(t,y)
%   t   = time series vector
%   y0  = Intial value of y
% output:
%   y = Values of y calculated at all x
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 04 July 2021

    dt = t(2)-t(1);
    nt = numel(t);
    y = zeros(1,nt);
    y(1) = y0;

    % Heun's Method
    for i = 1:nt-1
        y0 = y(i) + fun(t(i),y(i))*dt;
        y(i+1) = y(i) + (fun(t(i),y(i))+fun(t(i+1),y0))/2*dt;
    end
end
