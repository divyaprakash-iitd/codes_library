clear; clc; close all;

% Description: Finds the range and standard deviation of the given data

D = [67 55 74 43 53 62;
     74 70 87 53 38 29;
     31 22 50 25 61 59;
     86 29 45 74 92 11];
 
R = max(D,[],'all') - min(D,[],'all');
fprintf('Range: %d\n',R)

s = std(D(:));
fprintf('Standard deviation: %.2f\n',s)

