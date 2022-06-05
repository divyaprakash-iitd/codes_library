clear; clc; close all;

B = magic(4);
S = sum(B);
C = ones(4);

for j = 1:4
    C(:,j) = B(:,j)/S(j);
end

S1 = sum(C);

if all(S1==1)
    disp('the columns of C are probability vectors')
end