clear; clc; close all;

% Description: 1-sample t-test of the null hypothesis

x = [3.92 2.97 3.48 3.89 3.98 3.75 ...
    3.48 3.59 3.15 4.33 3.31 2.27 8.18 ...
    4.41 5.79 3.08 5.23 3.88 3.22 3.35 ...
    4.02 4.14 4.36 2.66 4.92 4.44 3.08 ...
    3.86 5.10 2.79 4.84 4.14 3.57 2.69 ...
    3.94 5.01 1.97 2.78 4.70 3.76 2.83 ...
    5.92 4.11 5.05 2.80 3.01 4.73 3.41 ...
    3.58 6.15 4.12 4.45 3.68 3.78 3.92 ...
    4.41 3.29 2.71 4.38 3.56 4.15 2.14 ...
    5.33 3.72 3.25 3.74 4.67 4.76 3.33 ...
    3.11 4.36 4.53 4.50 5.13 5.54 4.56 ...
    3.65 3.74 4.86 3.53 6.76 5.78 4.81 ...
    2.03 2.31 3.99 3.70 1.91 4.40 2.74 ...
    3.35 2.25 3.51 5.60 3.64 4.36 3.38 ...
    2.38 2.79 2.96];

[h,p,ci,stats] = ttest(x,7)