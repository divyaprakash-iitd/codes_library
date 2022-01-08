clear; clc; close all;

fprintf(temp(140))
fprintf(temp(100))
fprintf(temp(98))
fprintf(temp(96))

function Temperature = temp(T)

    if T > 130
       Temperature = sprintf('The temperature is dangerously high.\n');
    end

    if T < 130 && T > 99.5
        Temperature = sprintf('The temperature is slightly high.\n');
    end
    
    if T < 99.5 && T > 97.5
        Temperature = sprintf('The temperature is normal.\n');
    end
    
    if T < 97.5
        Temperature = sprintf('The temperature is below normal.\n');
    end
    
end