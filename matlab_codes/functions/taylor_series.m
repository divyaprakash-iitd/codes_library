function [y, yVal]= taylor_series(fun,n,x0,h)
% taylor_series: Returns the Taylor series and its evaluation at a point.
% [y, yVal]= taylor_series(fun,n,x0,h):
%   Returns the Taylor series of the given function and evaluates it at a
%   point.
%
% input: 
%   fun = Function entered as a string 
%   n   = Number of terms required in the Taylor series
%   x0  = Initial value
%   h   = Increment value
% output:
%   y    = The Taylor series of the given function returned as a string
%   yVal = The Taylor series of the given function evaluated at x0+h
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 18 June 2021

    f = str2sym(fun);

    for i = 1:n
        dyN = diff(f,i-1);
        if i == 1
            y = dyN*h^(i-1)/factorial(i-1);
        else 
            y = y + dyN*h^(i-1)/factorial(i-1);
        end
    end
    yVal = feval(matlabFunction(y),x0);
end