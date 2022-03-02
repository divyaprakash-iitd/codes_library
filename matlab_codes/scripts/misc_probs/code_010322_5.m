clear; clc; close all;

% Description: Computes a function

[y] = Problem2(11)
[y] = Problem2(2.5)

x = 1:0.1:10;
plot(x,Problem2(x))

function y = Problem2(x)
    y = (-0.421*x.^5 + 0.656*x.^4).*tand(8*x).*log(x).*exp(-0.858*x);
end

