function newData = createDW(data, n)
% Assigns day of the week as 1 through 7 according to day of the week
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix which contains day of the week 

newData =[];
for i = 1:n
    newData = [newData; weekday(data(i))];
end