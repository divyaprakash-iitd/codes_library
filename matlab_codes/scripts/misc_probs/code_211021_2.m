clear; clc; close all;

BSA = @(H,W) sqrt(H.*W/3131);

Wlb = @(W) W*2.20462;
Hin = @(H) H*0.393701;

% Change Height keeping weight fixed
W = 89; % [Kg]
H = 158:198;

subplot(1,3,1)
plot(Hin(H),BSA(Hin(H),Wlb(W)))
xlabel('H [in]')
ylabel('BSA [m^2]')

% Change Weight keeping height fixed
H = 178; % [cm]
W = 55:85;

subplot(1,3,2)
plot(Wlb(W),BSA(Hin(H),Wlb(W)))
xlabel('W [lb]')
ylabel('BSA [m^2]')

% Change Height and Weight simultaneously
H = 158:198;
W = 55:85;

[H,W] = meshgrid(H,W);
subplot(1,3,3)
surf(Hin(H),Wlb(W),BSA(Hin(H),Wlb(W)))
xlabel('H [in]')
ylabel('W [lb]')
zlabel('BSA [m^2]')




