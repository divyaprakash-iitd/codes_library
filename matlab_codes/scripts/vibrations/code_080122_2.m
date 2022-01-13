clear; clc; close all;

% Description: Finds the response of a transfer function 

% Set your desired value of m,c and k
m = 1;
c = 1;
k = 1;

num = [c k];
den = [-m c k]; 

sys = tf(num,den);