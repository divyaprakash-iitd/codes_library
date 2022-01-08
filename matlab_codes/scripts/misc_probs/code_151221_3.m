clear; clc; close all;

% Description: Plots a signal

N = 100;
x = linspace(0,10,N);
t = linspace(0,2,N);

Ufun = @(t,x) 10*sin(2*pi*(t-x/5)) + 2*sin(2*pi*(t+x/5));

U = zeros(N,N);
for i = 1:N
    for j = 1:N
        U(i,j) = Ufun(t(i),x(j));
    end
end

surf(t,x,U)
xlabel('t')
ylabel('x')
zlabel('U(t,x)')