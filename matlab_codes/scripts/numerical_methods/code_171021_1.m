clear; clc; close all;

% Description: Solves using a Trapzoidal method


%{
How to use the program:
Suppose you have these two non-linear equations to evaluate:
y=-x^2 +x +0.75
y +5xy =x^2
If the equations are chosen to be arranged in such an order:
x=(x -y +0.75)^(1/2)
y=(x^2 -y)/(5x)
where the initial guess is x=0 and y=0 with 0.00001% tolerance or upto 
15 iterations
Enter the 1st function without the isolated x. u(x,y)= sqrt(x-y+0.75)
Enter the 2nd function without the isolated y. v(x,y)= ((x^2)-y)/(5*x)
The initial guess for x variable is:0
The initial guess for y variable is:0
If 0.00001% tolerance:
Please choose what termination criteria you desire. 
Press "1" for approximate relative error and "2" for number of iterations:1
The desired approximate relative error in % is:0.00001
If 15 iterations:
Please choose what termination criteria you desire. 
Press "1" for approximate relative error and "2" for number of iterations:2
The desired number of iterations is:15
NOTE:
-The additional term "exp(-0.00001*x*y)" was added to prevent error in 
evaluating diff in cases when the derivative of one or both functions 
contain only one or no variables. These additional terms are adjusted or 
removed (subtracted) in the next lines of code, thus notaffecting the 
equations to be evaluated.
%}
%This is for inputs
m1=inputdlg('Enter the 1st function without the isolated x. u(x,y)=');   
s1=m1{:};
s11='+exp(-0.00001*x*y)';
d1=strcat(s1,s11);
u=str2func(['@(x,y)' d1]);
m2=inputdlg('Enter the 2nd function without the isolated y. v(x,y)=');   
s2=m2{:}
d2=strcat(s2,s11);
v=str2func(['@(x,y)' d2]);
%for plotting the equations
hold on
f11='-x';
d11=strcat(s1,f11);
f1=str2func(['@(x,y)' vectorize(d11)])
f22='-y';
d22=strcat(s2,f22);
f2=str2func(['@(x,y)' vectorize(d22)])
x=0:0.01:10;
y=0:0.01:10;
fig=ezplot(f1);
set(fig,'color','red');
ezplot(f2);
hold off
X=input('The initial guess for x variable is:');
Y=input('The initial guess for y variable is:');
n=0;
term=0;
syms x
syms y
%Lets the user choose which termination criterion it desires, whether be it a relative error or number of iterations
while (term<1)||(term>2)
    term=input('Please choose what termination criteria you desire.\nPress "1" for approximate relative error and "2" for number of iterations:');
    if term==1
        e=input('The desired approximate relative error in % is:');
        itr=NaN;
        break;
    end
    if term==2
        itr=input('The desired number of iterations is:');
        e=NaN;
        break;
    end
    fprintf('Wrong input! Please try again.\n\n');   
end
while (term<1)||(term>2)
    fprintf('Wrong input! Please try again.\n');
    term=input('Please choose what termination criteria you desire. Press "1" for approximate relative error and "2" for number of iterations:');
    if term==1 
    e=input('The desired approximate relative error in % is:');
    end
    if term==2
    itr=input('The desired number of iterations is:');
    e=NaN;
    end
end
du1=matlabFunction(diff(u(x,y),x));
du2=matlabFunction(diff(u(x,y),y));
dv1=matlabFunction(diff(v(x,y),x));
dv2=matlabFunction(diff(v(x,y),y));
dux=du1(X,Y)+(0.00001*Y*exp(-0.00001*X*Y));
duy=du2(X,Y)+(0.00001*X*exp(-0.00001*X*Y));
dvx=dv1(X,Y)+(0.00001*Y*exp(-0.00001*X*Y));
dvy=dv2(X,Y)+(0.00001*X*exp(-0.00001*X*Y));
conv1=abs(dux)+abs(duy);
conv2=abs(dvx)+abs(dvy);
if (abs(conv1)>=1)&&(abs(conv2)>=1)
    fprintf('\nWarning: The system may not totally converge!\n');
end
fprintf('\n');
%This is for labels
q='itrn';
j='current x';
w='solved x';
o='%rel. error x';
b='current y';
t='solved y';
T='%rel. error y';
k='     ';
label=[q,k,j,k,w,k,o,k,b,k,t,k,T];
disp(label);
%This is the loop program 
for i=1:100
    oldX=X;
    oldY=Y;
    %This is to evaluate the 1st derivative of both functions with respect to x
    %and y
    
    X=u(X,Y)-exp(-0.00001*X*Y);
    Y=v(X,Y)-exp(-0.00001*X*Y);
    g1=abs((abs(X-oldX)/X)*100);
    g2=abs((abs(Y-oldY)/Y)*100);
    fprintf('%2.0f %13.4f %13.4f %13.4f %16.4f %13.4f %15.4f\n',n,oldX,X,g1,oldY,Y,g2);
    n=n+1;
    if (g1<=e)||(g2<=e)||(n==itr) break;
    end
end
%Interpretation of results
if term==1
fprintf('\nThe desired relative error of %f is now reached at %.0fth iteration,\nwith a solved x root of %.4f and a solved y root of %.4f\n',e,n-1,X,Y);
end
if term==2
fprintf('\nThe desired number of iterations of %.0f is now reached at %.0fth iteration, \nwith a solved x root of %.4f and a solved y root of %.4f\n',itr,n-1,X,Y);
end
return
