clear; clc; close all;

% Description: Solves a QR factorization problem

N = 128;
[U,~] = qr(randn(N));
[V,~] = qr(randn(N));
D = diag(2.^(-1:-1:-N));
A = U*D*V;

[Q,R] = qr(A);