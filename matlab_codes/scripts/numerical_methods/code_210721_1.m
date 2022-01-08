clear; clc; close all;

% Description: Solves a system of linear equation using the LU
% Decomposition method

ud = repmat([-1 0],1,4); ud(end) = []; 
A = diag(-ones(1,6),2) + diag(ud,1) + diag(4*ones(1,8),0) + diag(ud,-1) + diag(-ones(1,6),-2);


b = [5 15 0 10 0 10 20 30]'; % Write the constants matrix, B
[L,U]=lu(A);

% Forward substitution
S=size(L);
m=S(1);
if S(1)~=S(2)
    error('matrix mast be square')
end
x=zeros(1,m);
x(1,1)=b(1)./L(1,1);

for k=2:m
        x1=1/L(k,k).*(b(k)-sum(L(k,k-1:-1:1).*x(k-1:-1:1)));
        x(1,k)=x1;
end
y=x';


% Bacward substitution
S=size(U);
m=S(1);
if S(1)~=S(2)
    error('matrix mast be square')
end
x=zeros(1,m);
x(1,m)=y(end)./U(m,m);

for k=m-1:-1:1

        x1=1/U(k,k).*(y(k)-sum(U(k,k+1:end).*x(k+1:end)));
        x(k)=x1;
end
x=x';

x