clear; clc; close all;

% Description: Reads data from file and plots a vector valued function.

% %% Generate random data
% 
%  N = 100;
%  t = linspace(0,1,N);
%  P = t.^2;
%  Q = t.^4;
%  R = sqrt(t);
%  
%  data = [P' Q' R' t'];
%  save('data_file.txt','data','-ascii')
 
 %% Read and plot the data
 data = load('data_file.txt');
 
 P = data(:,1); Q = data(:,2); R = data(:,3); t = data(:,4);
 
 u = 8*P;
 v = 2*Q;
 w = 3*R;
 
 plot3(u,v,w,'LineWidth',2)
 
 firstName      = 'Johnny';
 lastName       = 'Good';
 studentNumber  = '1234567';
 plotTitle      = [firstName,' ',lastName,' ',studentNumber];
 
 title(plotTitle)
 saveas(gca,'plot.png')