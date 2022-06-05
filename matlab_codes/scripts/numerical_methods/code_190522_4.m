clear; clc; close all;

% Description: Generates terms in a series

n = input('Enter the number of terms: ');
x = input('Enter the value of x: ');
s = 0;
i = 1;
while i <= n
    if i == 1
        s = s + x^1/(5*i);
    else
        s = s + x^(3*(i-1))/(5*i);
    end
    i = i + 1;
end
fprintf('The series summation is: %.6f\n',s)