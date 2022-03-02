clear; clc; close all;

% Description: Prints only the numbers with both even digits in the range 
% 10 to 99

for i = 10:99
    % Let the 2 digits in a number be represented as 'ab'
    a = floor(i/10);
    b = rem(i,10);

    if (mod(a,2) == 0) && (mod(b,2)==0)
        fprintf('%d ',i)
    end
end
fprintf('\n')