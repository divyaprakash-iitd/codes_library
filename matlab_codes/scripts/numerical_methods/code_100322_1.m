clear; clc; close all;

% Description: Fits a curve to the given data
t = 0:10;
posX = [-89.6 -11.06 112.31 214.00 323.44 396.68 485.76 ...
            614.22 709.61 797.10 886.83];
posY = [-187.40 300.61 805.45 1312.16 1773.80 2296.61 2794.79 ...
            3300.59 3816.35 4295.90 4794.23];

N = 1;

C = curve_fit_LSM(t,posX,N);
figure(1)

yyaxis left
hold on
scatter(t,posX)
plot(t,polyval(C,t))

C = curve_fit_LSM(t,posY,N);
yyaxis right
hold on
scatter(t,posY)
plot(t,polyval(C,t))

function C = curve_fit_LSM(x,y,N)
    NC = N + 1; % Number of coefficients

    % Preallocate the Matrix and Vector
    A = zeros(NC,NC);
    b = zeros(NC,1);
    
    % Construct the Matrix and Vector
    for row = 1:NC
        for col = 1:NC
            A(row,col) = sum(x.^(col - 2 +row));
        end
        b(row) = sum(x.^(row - 1).*y);
    end

    C = flip(A\b);
end