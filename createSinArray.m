function newData = createSinArray(sinDW, sinDY, data, n)
% This function adds the day of the week and day of the year sine functions 
% as descriptors for each instance
% Input : sinDW = a column matrix of sin(day of the week)
%       : sinDY = a column matrix of sin(day of the year)
%       : data = original data matrix
%       : n = # of selected rows from data matrix
% Output: newData = a new matrix of sinDW, sinDY and data

newData=[];
[~,p] = size(data); % p = # of columns in data matrix
for i=1:n
    newData=[newData;sinDW(i) sinDY(i) data(i, 2:p)];   
end
