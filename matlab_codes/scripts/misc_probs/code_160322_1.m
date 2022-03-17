clear; clc; close all;

% Description: Solves a system of equation using Gauss-Elimination
A = [1 0 1; 1 1 1; 1 -1 1];
b = [2 3 1];

x = gausselimination(A,b)

function x = gausselimination(A,b)
B = b(:);
P=[ A B ]; 
[row,col ] = size(P);

for m = 1:row-1 
    a=P(m,m);  
     P(m,:)= P(m,:)/a;
    for k=m+1:row     
      P(k,:)= P(k,:)- P(k,m)* P(m,:);
    end
end
 a=P(row,row);  
 P(row,:)= P(row,:)/a;
 s=0;
for m=row:-1:2
    for k=m+1:col
        s=s+P(m-1,k-1)* P(k-1,col);
        P(m-1,col)= P(m-1,col)- s; 
        s=0;
    end
end

  x = P(:,col);
end