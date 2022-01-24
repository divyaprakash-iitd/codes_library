clear; clc; close all;

% Description: Data visualization using bar plots

Country = categorical({'Ecuador','India','Peru','Haiti','Vietnam',...
          'Dominican Rep','Poland','Jamaica','Colombia','Guatemala'});
Country = reordercats(Country,{'Ecuador','India','Peru','Haiti','Vietnam',...
          'Dominican Rep','Poland','Jamaica','Colombia','Guatemala'}); 
Data = [55 68;
        68 80;
        63 72;
        63 72;
        79 86;
        62 69;
        74 81;
        71 78;
        67 74;
        38 44];
    
h = bar(Country,Data,'grouped');
legend(h,{'2005','2015'})
ylabel({'Percentage of immmigrants eligible for','U.S. citizenship who have naturalized'})