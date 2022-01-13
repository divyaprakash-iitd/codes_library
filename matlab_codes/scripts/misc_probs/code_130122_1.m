clear; clc; close all;

% Description: Solves a matrix rotation problem

R = Rx(0)
R = Rx(1)

function R = Rx(psi)
    % psi : Angle in radians
    R = [1 0 0; 0 cos(psi) -sin(psi); 0 sin(psi) cos(psi)];
end



