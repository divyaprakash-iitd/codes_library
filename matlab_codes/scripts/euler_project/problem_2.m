clear; clc; close all;

% Description: Even Fibonacci numbers

% Generate Fibonacci numbers

a = 1;
b = 2;
c = a+b;
s = b;
while c < 4e6
    if (mod(c,2) == 0)
        s = s + c;
    end
    c = a+b;
    a = b;
    b = c;
end