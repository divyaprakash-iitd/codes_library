clear; clc; close all;

% Description: Solves a Laplace equation

A = [1 -0.25 0;
     -0.25 1 -0.25;
     0 -0.25 1];
 b = [0.9375 5 14.823]';
 
 u = A\b