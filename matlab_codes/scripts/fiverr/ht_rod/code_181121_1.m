clear; clc; close all;

k = 110;
rho = 15800;
cp = 250;
D = k/rho/cp;

Nr = 10;
Nz = 10;
A(Nr,Nz,5) = 0;
B(Nr,Nz) = 0;

dr = R/(Nr-1);
dz = Z/(Nz-1);

BOTTOM = 1;
LEFT = 1;
CENTER = 1;
RIGHT = 1;
TOP = 1;

dt = 1;
% Create the matrix
for j = 1:Nz
    for i = 1:Nr
        A(i,j,CENTER) = 1/D/dt + 2/dr^2 + d/dz^2;
        A(i,j,RIGHT) = -1/((i-1)*dr)^2/dr - 1/dr^2;
        A(i,j,LEFT) = 1/((i-1)*dr)^2/dr - 1/dr^2;
        A(i,j,TOP) = -1/dz^2;
        A(i,j,BOTTOM) = -1/dz^2;
        B(i,j) = 1/D/dt*T(i,j);
    end
end

% Top nodes
j = Nz;
for i = 1:Nr
    A(i,j,RIGHT) = 0;
    A(i,j,Left) = A(i,j,Left);
    A(i,j,CENTER) = A(i,j,CENTER) - 2*h*dz/k;
end