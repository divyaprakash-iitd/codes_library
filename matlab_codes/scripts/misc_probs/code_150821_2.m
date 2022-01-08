clear; clc; close all;

% Description: Plots a Fourier series

A = 1; w = 10;

t = linspace(-2*pi,2*pi,1000);
f = FS(t,20);
plot(t,f)

function f = FS(t,N)
    A = 1; w = 10;

    f = zeros(1,numel(t));
    for n = 1:2:(2*N-1)
        n
    f = f + ...
        ((-1).^(n-1)/2 * ...
         1/n.^2 * ...
         sin(n.*w.*t));
    end
    f = 8*A/pi^2 * f;
end

% 
% f = @(n,t)      sum(8*A/pi^2 * ...
%                 (-1).^(((1:2:(2*n-1))-1)/2) * ...
%                  1/(1:2:(2*n-1)).^2 * ...
%                  sin((1:2:(2*n-1)).*w.*t));
% 
% t = linspace(-2*pi,2*pi,1000);
% 
% nt = numel(t);
% FS = zeros(nt);
% n = 200;
% for i = 1:nt
%     FS(i) = f(n,t(i));
% end
% 
% plot(t,FS)