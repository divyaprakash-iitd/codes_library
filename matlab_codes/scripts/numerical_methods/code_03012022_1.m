clear; clc; close all;

% Description: Solves a system of linear equations using the conjugate
% gradient method

% Generate the discretized 2D Laplacian operator
M = numgrid('S',66);
A = delsq(M);

xs = rand(4096,1);
b = A*xs;


figure(1)
hold on

% Conjugate Gradient Method
tol = 1e-14;
x = b;
r = b - A*x;

y = -r;
z = A*y;
s = y'*z;
t = (r'*y)/s;
x = x + t*y;

for k = 1:numel(b)
   r = r - t*z;
   if( norm(r) < tol )
        break;
   end
   B = (r'*z)/s;
   y = -r + B*y;
   z = A*y;
   s = y'*z;
   t = (r'*y)/s;
   x = x + t*y;
   res = norm(b - A*x);
   err = norm(x-xs);
   yyaxis left
   plot(k,err,'b*')
   yyaxis right
   plot(k,res,'r.')
end
yyaxis left
ylabel('Error')
set(gca, 'YScale', 'log')
yyaxis right
ylabel('Residual')
set(gca, 'YScale', 'log')
xlabel('Iterations')
grid on

