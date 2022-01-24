clear; clc; close all;

% Description: Solves two problems

syms x
p = x^12 -1;

roots = double(solve(p,x,'MaxDegree',3));

f = @(x) x.^4 + x.^2 +1;

r = roots(f(roots)<=1e-14);

fprintf('The required roots are as follow.\n')
disp(r)

a = sqrt(1i);clear; clc; close all;

% Description: Solves two problems

syms x
p = x^12 -1;

roots = double(solve(p,x,'MaxDegree',3));

f = @(x) x.^4 + x.^2 +1;

r = roots(f(roots)<=1e-14);

fprintf('The required roots are as follow.\n')
disp(r)

a = sqrt(1i);
for k = 1:6
    a = a^sqrt(1i);
end

fprintf('Real part: %.4f\n',real(a))
fprintf('Imaginary part: %.4f\n',imag(a))
for k = 1:6
    a = a^sqrt(1i);
end

fprintf('Real part: %.4f\n',real(a))
fprintf('Imaginary part: %.4f\n',imag(a))