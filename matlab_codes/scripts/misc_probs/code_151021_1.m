clear; clc; close all;

% Description: Solves a matrix inversion problem

A = [1 2 -1; 1 1 1;1 -1 0];
B = [1 -1 0; 1 1 1; 1 2 -1];

E = inv(A)