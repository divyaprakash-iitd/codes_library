clear; clc; close all;

% Description: Linear programming

A = [2 1;
     1 1;
     1 2];
 b = [12 7 10];
 
 f = [30 40];
 
 x = linprog(f,A,b);