clear; clc; close all;

% Description: Finds the area of a circle using Monte-Carlo method

r = 0.5;
a = -r; b = r;

isuc = 0;
N = 100000;

for i = 1:N
    x = (b-a)*rand(1,1) + a;
    y = (b-a)*rand(1,1) + a;
    
    if (x^2+y^2 <= r^2)
        isuc = isuc + 1;
    end
end

Abox = (2*r)^2;
Acircle = Abox*isuc/N;

fprintf('Area of circle: %.4f\n',Acircle)
fprintf('Absolute Error: %e\n',abs(Acircle-pi*r^2))s
