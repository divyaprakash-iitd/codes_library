function I = simpson13(f,a,b,n)
% simpson13: Calculates the integral using Simpson's 1/3rd rule 
% I = simpson13(f,a,b,n):
% Calculates the integral using Simpson's 1/3rd rule 
% Example:
%   f     = @(x) sqrt(2*x);
%   a     = 0;
%   b     = 10;
%   n     = 20;
%   I     = simpson13(f,a,b,n);
%   Itrue = integral(f,a,b);
%   fprintf('Absolute Error: %. 4f\n',abs(I-Itrue))
% input: 
%   f     = A function handle for the function to be integrated
%   a     = Lower limit of integration
%   b     = Upper limit of integration
%   n     = Number of segments (Must be even)
% output:
%   I     = Integral value
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 20 January 2022

	h = (b-a)/n;
	x = a:h:b;
	I = h/3*(f(x(1)) + 2*sum(f(x(3:2:n-1))) + 4*sum(f(x(2:2:n))) + f(x(n+1)));
end