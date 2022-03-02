clear; clc; close all;

% Description: Writes a matrix to Excel file

MyMatrix = eye(20);

xlswrite('Problem3.xlsx',MyMatrix,6,'D24')