clc; clear;

% Description: Simulates a darts (Bullseye) game

d = input("Enter the target's diameter: ");

darts = 0;
points = 0;
max_points = 25;

ro = 0;
r1 = 3/2;
r2 = d/2;
while points < max_points
    x = (r2-ro)*rand(1,1) + ro;
    y = (r2-ro)*rand(1,1) + ro;
    
    darts = darts + 1;
    if sqrt(x^2+y^2) <= r1
        points = points + 3;
        fprintf('Total darts: %d\n',darts)
        fprintf('Bullseye! Total points: %.1f\n',points')
    elseif sqrt(x^2+y^2) > r1
        points = points + 0.5;
        fprintf('Total darts: %d\n',darts)
        fprintf('Total points: %.1f\n',points)
    end
end 

fprintf('\nGame Over!\n')
fprintf('Total darts: %d\n',darts)
fprintf('Total points: %.1f\n',points)