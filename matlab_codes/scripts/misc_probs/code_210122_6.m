clear; clc; close all;

% Description: This script demonstrates the loss of significance

a = sqrt(3);
e = 1e-7;
[b, ed, abserr, relerr] = fb(a,e)

figure(1)
hold on
xlabel('\epsilon')
for j = 1:10
    e = 10^(-j);
    [~, ~, abserr, relerr] = fb(a,e);
    yyaxis left
    plot(e,abserr,'x')
    ylabel('Absolute error')
    
    yyaxis right
    plot(e,relerr,'*')
    ylabel('Relative error')
end
grid on
yyaxis left
set(gca, 'XScale', 'log', 'YScale', 'log')
yyaxis right
set(gca, 'YScale', 'log')

function [b, ed, abserr, relerr] = fb(a,e)
    b = a*(1+e);
    ed = b/a - 1;
    
    abserr = abs(e-ed);
    relerr = abserr/e;
end
