clear; clc; close all;

% Description: Prints the days and dates.

day = {'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'};
month = {'Aug', 'Sep'};

for iMonth = 1:2
    date = 1;
    for iWeek = 1:5
        for iDay = 1:7
            fprintf('%s %d %s\n\n',month{iMonth}, date, day{iDay})
            date = date + 1;
            if date == 32 && strcmp(month{iMonth},'Aug')
                break;
            end
            if date == 31 && strcmp(month{iMonth},'Sep')
                break;
            end
        end
    end
end