clear; clc; close all;

% Description: Sale of point program

product = {'Salad','Soap','Machboos','Biryani'};
type = {'Vegan','Vegetarian','Lamb','Chicken'};
price = [1.35,1.55,3.55,2.55];

% Display menu
fprintf('Welcome to AIU Boutique; Please choose your order from the following menu:\n')
for i = 1:4
    fprintf('%d)  %s   (%s)\n',i,product{i},type{i});
end
fprintf('5) Receipt\n');    

cost = 0;
while 1
    P = input(' :');
    if isempty(P)
        break;
    end
    n = input(sprintf('How many %ss?: ',product{P}));
    cost = cost + n*price(P);
end

reply = input('Are you eligible for student discount? (yes/no): ','s');
discount = 10/100;

if strcmp(reply,'yes')
    acost = (1-discount)*cost;
else
    acost = cost;
end

% Print receipt
fprintf('\n')
fprintf('Original price     :%.2f K.D\n',cost);
fprintf('Discount           :%.2f%%\n',discount*100);
fprintf('You pay            :%.2f K.D\n',acost);
fprintf('Your Saving        :%.2f K.D\n',cost-acost);

