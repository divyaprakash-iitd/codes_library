clear; clc; close all;

% Description: Multiples of 3 or 5

num = 1:999;

mul3 = num(mod(num,3) == 0);
mul5 = num(mod(num,5) == 0);
mulboth = num((mod(num,3) == 0) & (mod(num,5) == 0));
s = sum(mul3) + sum(mul5) -  sum(mulboth);
