function newData = createCosArray(cosDW, cosDY, data, n)
% This function adds the day of the week and day of the year cosine 
% functions as descriptors for each instance.
% Input : cosDW = a column matrix of cos(day of the week)
%       : cosDY = a column matrix of cos(day of the year)
%       : data = original data matrix
%       : n = # of selected rows from data matrix
% Output: newData = a new matrix of cosDW, cosDY and data

newData=[];
[~,p] = size(data); % p = # of columns in data matrix 
for i=1:n
    newData = [newData; cosDW(i) cosDY(i) data(i, 1:p)];  
end
