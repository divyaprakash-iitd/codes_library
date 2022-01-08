clear; clc; close all;

% Description: Solves a problem using Richardson extrapolation table

h = [0 0.5 0.25 0.125 0.0625];
P = [0, 0.520499877813047, 0.27632639016801334, 0.140316204801334, 0.070431977722387];

N = numel(h);
for i = 1:N-1
    fd(i) = (P(i+1)-P(1))/h(i+1);
end

for i = 1:N-2
    re1(i) = 4/3*fd(i+1) - 1/3*fd(i);
end

for i = 1:N-3
    re2(i) = 4/3*re1(i+1) - 1/3*re1(i);
end

for i = 1:N-4
    re3(i) = 4/3*re2(i+1) - 1/3*re2(i);
end

fprintf('Column: 1\n')
disp(fd')
fprintf('Column: 2\n')
disp(re1')
fprintf('Column: 3\n')
disp(re2')
fprintf('Column: 4\n')
disp(re3')
