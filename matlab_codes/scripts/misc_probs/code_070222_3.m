clear; clc; close all;

% Description: Calculates the variation of stress intensity factor

M = 20;
b = 0.25;
t = 0.01;
alpha = 0.01:0.01:0.9;

a = b*alpha;
beta = pi*alpha/2;

C = sqrt(tan(beta)./beta).* (0.923 + 1.99*(1-sin(beta)).^2)./cos(beta);

sigma = 6*M/t./b.^2;

K1 = C.*sigma.*sqrt(pi.*a);

plot(a,K1)

fprintf('a [m]          K1\n')

for i = 1:numel(alpha)
    fprintf('%.4f\t%.4f\n',a(i),K1(i))
end

xlabel('a [m]')
ylabel('K1')
grid on
