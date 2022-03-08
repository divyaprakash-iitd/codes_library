clear; clc; close all;

% Description: Creates a vector of structures

for i = 1:4
    s(i).type   = input('Enter the type: ','s');
    s(i).vol    = input('Enter volume per container (L): ');
    s(i).n      = input('Enter no. of containers: ');
end

fprintf('Available fieldnames')
disp(fieldnames(s))

fieldname = input('Enter the field name to sort the structure form the list above: ','s');
[~, idx] = sort({s.(fieldname)});
fprintf(sprintf('Structure sorted according to %s.\n',fieldname))
disp(struct2table(s(idx)))

