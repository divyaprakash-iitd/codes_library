clear; clc; close all;

% Description: Numerical integration using composite trapezoidal method

func = @(T) -12.363*(-1.2278e-11*T.^2 + 6.1946e-9*T + 6.015e-6);
a = -108; b = 80; 

fprintf('   n      True Value      True Error      Approximate Error\n');

i = 1;
for n = 2:10
    I(i) = trap(func, a, b, n);
    TV(i) = integral(func,a,b); % True Value = true value - approximate value
    TE(i) = TV(i) - I(i); % True Error
    AE(i) = trap(func, a, b, n) - trap(func, a, b, n-1); % Approximate Error = present approximation – previous approximation
    fprintf('%4d %15.8f %15.8f %15.8f\n',n,TV(i),TE(i),AE(i));
    i = i+1;
end

n = 2:10;

subplot(2,1,1)
plot(n,TV)
xlabel('No. of segments')
ylabel('Approximation')
grid on

subplot(2,1,2)
hold on
plot(n,abs(TE),'DisplayName','True Error')
plot(n,abs(AE),'DisplayName','Approximate Error')
xlabel('No. of segments')
ylabel('|Error|')
grid on


function I = trap(func, a, b, n, varargin)
% trap: composite trapezoidal rule quadrature
% I = trap(func, a ,b,n,p1,p2,…): composite trapezoid rule
% input:
% func = name of function to be integrated
% a, b = integration limits
% n = number of segments (default = 100)
% p1, p2, …=additional parameters used by func
% output:
% I = integral estimate

if nargin<3, error ('at least 3 input arguments required'), end
if ~(b>a), error ('upper bound must be greater than lower'), end
if nargin<4 || isempty(n); n=100; end

x = a;
h=(b-a)/n;
s = func(a, varargin{:});

for i=1:n-1
    x = x+h;
    s = s+2*func(x, varargin{:});
end

s = s+func(b, varargin{:});
I = double((b-a)*s/(2*n));
end

