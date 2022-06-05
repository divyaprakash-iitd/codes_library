clear; clc; close all;

% Description: Geomterical interpretation of the solution set of a system
% of two equations

% A = [1 2;0 0]; c= [5;-2];
% A=[0 2;0 5]; c = [5;1];
% A=[0 2;0 5]; c = [2;5];
% A = pascal(2); c = [-1;3];
% A=[1,2;2,4]; c = ones(2,1);
% A=[1,2;2,4]; c = sum(A,2);
A =hilb(2);c=randi(5,2,1);
[solution,x] = lines(A,c)

function [solution,x] = lines(A,c)
    format
    solution = [];
    x = [];

    if all(any(A,2))
        disp('each equation of the system represents a line')
    else
        disp('the input A is geometrically invalid')
        return
    end

    aug = [A c];

    % If rank(A) = rank(A|B) = the number of rows in x, 
    % then the system has a unique solution. 
    % If rank(A) = rank(A|B) < the number of rows in x, 
    % then the system has ∞-many solutions. 
    % If rank(A) < rank(A|B), then the system is inconsistent.

    if rank(A) == rank(aug)
        disp('The system is consistent')
        if rank(A) == size(A,1)
            disp('the lines have only one point in common')
            solution = 'point';
            n1 = A(1,:);
            n2 = A(2,:);
            cos_theta = abs(dot(n1,n2))/(norm(n1)*norm(n2));
            if cos_theta >= 1
                theta = 0;
            else
                theta = acosd(cos_theta);
            end
            fprintf('angle between the intersecting lines is %i \n',theta);

        else
            disp('the lines are coincident')
            solution = 'line';
            aug = aug(1,:);
        end
        x = aug(:,1:2)\aug(:,end);
    else
        disp('system is inconsistent and the lines have no points in common')
        N = ones(2,1);
        for i = 1:2
            N(i) = norm(A(i,:));
        end
        aug=aug./N;
        n1 = aug(1,1:2);
        n2 = aug(2,1:2);

        s = sign(dot(n1,n2));
        d = abs(aug(1,end)-s*aug(2,end));
        fprintf('The distance between the parallel lines is %i\n',d)
    end

end