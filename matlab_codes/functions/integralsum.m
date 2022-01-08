function I = integralsum(f,a,b,n,typeI)
% integralsum: Approximates an integral by a finite sum
% I = integralsum(f,a,b,n,typeI):
%   Approximates an integral by a finite sum using one of the following
%   methods
%   1. Left Riemann Sum
%   2. Right Riemann Sum
%   3. Mid-point Method
% Example:
%   f = @(x) log(sin(x)+1)
%   a = 0; b = pi/2; n = 10; 
%   I = integralsum(f,a,b,n,'mid')
% input: 
%   f       = A function handle
%   a       = Lower limit of integration
%   b       = Upper limit of integration
%   n       = Number of divisions
%   typeI   = A string specifying the type of integration to be carried out
%             (left,right,mid)
% output:
%   I       = Integral value
%
% Author: Divyaprakash
%         Mechanical Engineer
% e-mail: divyaprakash.poddar@gmail.com
% Date  : 06 January 2022

	dx = (b-a)/n;
	x = a:dx:b;
	if strcmp(typeI,'left')
		% Left Riemann Sum
		I = sum(dx*f(x(1:n)));
	elseif strcmp(typeI,'right')
		% Right Riemann Sum
		I = sum(dx*f(x(2:n+1)));
	elseif strcmp(typeI,'mid')
		% Mid-Point Method
		c = (a+dx/2):dx:(b-dx/2)
		I = sum(dx*f(c));
	else
		printf('Invalid integration type!\n')
	end
end
