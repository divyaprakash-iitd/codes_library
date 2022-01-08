clear; clc; close all;

%% Description: Solves a system of equation in matrix form.

A = [-2   4   1   5   0;
       0   2   0   4   2;
      -1  -2   0   3   2;
       2   1  -4  -5  -1;
       0  -2  -3   0   0];
  

b = [-26 -18 -29 54 1]';

x = gausselimination(A, b);
fprintf('Solution\n')
disp(x)

% Consistency check
AB = [A b];
fprintf('Rank of A: %d\n',rank(A));
fprintf('Rank of (A|B): %d\n',rank(AB));

function x = gausselimination(A, b)
n = size(A, 1);  
r = zeros(n, 1); 
for i = 1 : 1 : n    
   r(i) = i;
end
x = zeros(n, 1); 
for k = 1 : 1 : n    
    % Compare each element in r(k)th column for the max
    max = abs(A(r(k), r(k)));    
    max_pos = k;    
    for l = k : 1 : n        
        if abs(A(r(l), r(k))) > max            
            max = abs(A(r(l), r(k)));            
            max_pos = l;            
        end
    end
    % Switch the kth r-vector element with max r-vector element
    temp_r = r;
    r(k) = temp_r(max_pos);
    r(max_pos) = temp_r(k);
    % Eliminate A-vector elements in r(k)th column below r(k)th row        
    for i = 1 : 1 : n
        if i ~= k
            zeta = A(r(i), k) / A(r(k), k);
            for j = k : 1 : n
                A(r(i), j) = A(r(i), j) - A(r(k), j) * zeta;                       
            end
            b(r(i)) = b(r(i)) - b(r(k)) * zeta;
        end
    end
end
% Compute the solution from the diagonalized A-matrix
for i = 1 : 1 : n
    x(i) = b(r(i)) / A(r(i), i);
end
end