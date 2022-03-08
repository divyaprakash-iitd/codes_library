clear; clc; close all;

% Description: Finds the maximum number and the index of the number

filename = 'test.txt'; % Please replace text.txt with the approproate filename

a = dlmread(filename);
[val,pos] = maxFL(a)

function [val, pos] = maxFL(a)
    val = max(a);
    i = find(a==val);
    pos = i(1);
end