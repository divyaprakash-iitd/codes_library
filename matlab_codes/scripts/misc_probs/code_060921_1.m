clear; clc; close all;

% Description: International Standard Atmosphere Model
T0 = 288.15;

N = 1000;
h = linspace(0,47,N);

Temp = @(H) integral(@dTdh,0,H) + T0;
Tinv = @(H) 1./(integral(@dTdh,0,H) + T0);

hold on
for i = 1:N
    plot(Temp(h(i)),h(i),'r.')
end

function r = dTdh(H)
    nH = numel(H);
    r = zeros(1,nH);
    for i = 1:nH
        h = H(i);
        if h <= 11
            r(i) = -6.5;
        elseif h > 11 && h <= 20
            r(i) = 0;
        elseif h > 20 && h <= 32
            r(i) = 1;
        elseif h > 32 && h <= 47
            r(i) = 2.8;
        end
    end
end