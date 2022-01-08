function fixed_point_systems(x0, N)


%Fixed_Point_Systems(x0, N) approximates the solution of a system of nonlinear
%equations F(x) = 0 rewritten in the form x = G(x) starting with an initial 
%approximation x0. The iterative technique is implemented N times
%The user has to enter the function G(x)at the bottom
%The output consists of a table of iterates whereby each column displays
%the iterates of x1, x2, ..., xn until the maximum number of iterations is reached 
%or the stopping criterion is satisfied.

%Author: Alain G. Kapitho
%Date  : Jan. 2006

n = size(x0,1);
if n == 1
   x0 = x0';
end

i = 1;
x(:,1) = x0;
tol = 1e-05;
while i <= N
   x(:,i+1) = G(x(:,i));
   if abs(x(:,i+1)-x(:,i)) < tol		%stopping criterion
      disp('The procedure was successful after k iterations')
      k = i
      disp('Iterated solution of nonlinear system')
      x = x'
      return
   end
   i = i+1;
end

if abs(x(:,i)-x(:,i-1)) > tol || i > N
   disp('The procedure was unsuccessful')
   disp('Condition |x(i+1)-x(i)| < tol was not sastified')
   tol
   disp('Please, examine the sequence of iterates')
   disp('In case you observe convergence, then increase the maximum number of iterations')
   disp('In case of divergence, try another initial approximation x0')
   x = x'
end

%this part has to be changed accordingly with the specific function G(x)
function y = G(x)
% y = [(1/3)*cos(x(2)*x(3))+1/6;
%    (1/9)*sqrt(x(1)^2 + sin(x(3)) + 1.06) - 0.1;
%    (-1/20)*exp(-x(1)*x(2)) - (10*pi - 3)/60];
y = [sin(x(1)*x(2)) - x(2)/2/pi;
     1/2/exp(1)*((1-1/4/pi)*(exp(2*x(1))-exp(1))+exp(1)*x(2)/pi)]

