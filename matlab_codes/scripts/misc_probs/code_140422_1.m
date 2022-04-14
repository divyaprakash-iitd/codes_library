clear; clc; close all;

% Description: Creates a pyramid matrix

while true
    N = input('Enter an odd integer: ');
    if mod(N,2) ~= 0
        break;
    end
end

A = zeros(N);
for i = 1:N
    A(i,1:i) = 1:i;
end

A = [fliplr(A) A(:,2:end)];

disp(A)