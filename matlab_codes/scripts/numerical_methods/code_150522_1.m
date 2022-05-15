clear; clc; close all;

% Description: Solve a system of equations using the LU decomposition
% method
A = [2 3 4;5 7 9;8 1 7];
b = [2 1 3]';

[L,U,P] = Lu(A);
Y=TriangleForwardSub(L,P*b);
X=TriangleBackwardSub(U,Y);

function C=TriangleForwardSub(L,b)
    s=length(b);
    C=zeros(s,1);
    C(1)=b(1)/L(1,1);
    for j=2:s
        C(j)=(b(j) -sum(L(j,1:j-1)'.*C(1:j-1)))/L(j,j);
    end
end

function C=TriangleBackwardSub(U,b)
    s=length(b);
    C=zeros(s,1);
    C(s)=b(s)/U(s,s);
    for j=(s-1):-1:1
        C(j)=(b(j) -sum(U(j,j+1:end)'.*C(j+1:end)))/U(j,j);
    end
end


function [L,U,P] = Lu(A)
    s=length(A);
    U=A;
    L=zeros(s,s);
    PV=(0:s-1)';
    for j=1:s
        % Pivot Voting (Max value in this column first)
        [~,ind]=max(abs(U(j:s,j)));
        ind=ind+(j-1);
        t=PV(j); PV(j)=PV(ind); PV(ind)=t;
        t=L(j,1:j-1); L(j,1:j-1)=L(ind,1:j-1); L(ind,1:j-1)=t;
        t=U(j,j:end); U(j,j:end)=U(ind,j:end); U(ind,j:end)=t;
    
        % LU
        L(j,j)=1;
        for i=(1+j):size(U,1)
           c= U(i,j)/U(j,j);
           U(i,j:s)=U(i,j:s)-U(j,j:s)*c;
           L(i,j)=c;
        end
    end
    P=zeros(s,s);
    P(PV(:)*s+(1:s)')=1;
end