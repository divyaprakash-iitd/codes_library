clear; clc; close all;

% Description: Calculates an integral using the trapezoidal rule and uses
% the finite difference formulas to calculate the derivatives.

h = 3;
d = 1:h:22;
D = [3689 3780 4187 3876 4000 4106 3874 3741];

TDC = trapz(d,D)

R = zeros(size(D));

R(2:end-1) = (D(3:end) - D(1:end-2))/2/h;
R(1) = 1/h*(-3/2*D(1) + 2*D(2) - 1/2*D(3));
R(end) = 1/h*(3/2*D(end) - 2*D(end-1) + 1/2*D(end-2))