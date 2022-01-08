clear; clc; close all;

% Description: Plots equations

a = 0.49; b = 0.48;

P = [];

P = [P 200 198];

niter = 1000;

for i = 1:niter
    Ptemp = a*P(end) + b*P(end-1);
    P = [P Ptemp];
end

plot(P)