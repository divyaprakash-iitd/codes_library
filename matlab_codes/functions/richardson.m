function [df, rtable] = richardson(fun,x0,h)
% richardson: Calculates approximation using Richardson's extrapolation
% [x, rtable] = richardson(fun,x0,h):
%   Calculates approximation using Richardson's extrapolation by improving
%   the approximation calculated by the central difference method
% Example:
%   f           = @(x) -0.1*x^4 - 0.15*x^3 - 0.5*x^2 - 0.25*x + 1.2;
%   h           = [0.5 0.25];
%   x0          = 0.5;
%   [df rtable] = richardson(f,x0,h)
% input: 
%   f        = A function handle
%   x0       = Point at which the derivative is to be calculated
%   h        = A vector containing the step sizes
% output:
%   x        = The derivative approximation
%   rtable   = Richardson's extrapolation table 
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 08 January 2022

    N = numel(h);
    rtable = zeros(N,N);

    for i = 1:N
        rtable(i,1) = (fun(x0 + h(i))-fun(x0-h(i)))/2/h(i);
    end

    for j = 2:N
        for i = 1:N-j+1
            rtable(i,j) = 4/3*rtable(i+1,j-1) - 1/3*rtable(i,j-1);
        end
    end
    df = rtable(1,end);
end