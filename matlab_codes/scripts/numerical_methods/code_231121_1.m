clear; clc; close all;

% Description: Solves a system of equation

A = [4 5;-6 10];
b = [-2 -32];

disp('Augmented Matrix')
disp([A b'])

disp('Matrix form of the system')

syms x y
disp([A [x;y]][-2;-32])



