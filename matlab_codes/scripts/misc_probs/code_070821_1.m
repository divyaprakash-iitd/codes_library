clear; close all; clc;

% Description: Plots a pdf

% Task 1
n = 100000;
X = randn(1,n);

figure(1)
plot(X)

% Task 2
figure(2)
h = histogram(X);
[N,edges] = histcounts(X,'Normalization','pdf');
histogram('BinEdges',edges,'BinCounts',N)

% Task 3
f = @(x) 1/sqrt(2*pi)*exp(-x.^2/2);
x = linspace(min(X),max(X),n);
y = f(x);
hold on
plot(x,y)

% Task 4
A = trapz(x,y);
fprintf('Area under the curve: %.10f\n',A)

% Task 5

Ppdf = trapz(x,y) - trapz(x(x<=2),y(x<=2));

% Q-function
qfun = @(t) exp(-t.^2/2);
Pq = 1/sqrt(2*pi)*integral(qfun,2,Inf);

fprintf('P(X>2)\n')
fprintf('Theoretical: %.10f\n',Ppdf)
fprintf('Q-Function: %.10f\n',Pq)