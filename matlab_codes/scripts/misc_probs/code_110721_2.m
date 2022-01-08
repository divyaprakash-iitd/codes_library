clear; clc; close all;

% Description: Plots some functions

Y0 = 4;
xD = 35;
theta = 0;
n = 1000;
x = linspace(-10,10,n);
y = zeros(size(x));

N = 1000; % Number of terms to be used in the summation

for i = 1:n
    y(i) = Y(x(i),theta,Y0,xD,N);
end

plot(x,y)
xlabel('x')
ylabel('Y')

function y = Y(x,theta,Y0,xD,N)
    A = Y0*exp(-(x/xD)^3);
    B = sin(theta);
    C = 0;
    for n = 1:N
        C = C + (-1)^n*x^(4*n+1)/4^n/(4*n+1)/factorial(2*n);
    end
    D = sqrt(pi)/2;
    E = cos(theta+x^2/2);
    
    y = A * (B + x*(C - D)*E);
end