clear; clc; close all;

M = [0 3 7 0 9 2;
     1 0 5 3 7 4;
     6 6 0 2 8 0;
     1 8 5 0 3 9;
     0 3 7 9 6 1;
     0 0 3 7 0 0];

n = length(M);

i = 1;
m = 1; % Not singular
l = 1;
while ((i <= n) &&  (m == 1))
    if (M(i,i) == 0)
        while (l < n) && (M(l,i) == 0)
            l = l + 1
            if (M(l,i)~=0 && M(i,l)~=0)
                temp_vec = M(l,:)
                M(i,:) = M(l,:);
                M(l,:) = -temp_vec;
            end
        end
        end
        i = i +1
end
M
