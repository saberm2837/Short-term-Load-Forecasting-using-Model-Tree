function newData= createHRWE(hourly,weekend, data, n)
% This function adds the hourly and weekend data as descriptors for each instance.
% Input : hourly = a column matrix 
%       : weekend = a column matrix  
%       : data = original data matrix
%       : n = # of selected rows from data matrix
% Output: newData = a new matrix of hourly, weekend and data

newData=[];
[~,p] = size(data); % p = # of columns in data matrix 
for i=1:n
    newData=[newData; hourly(i) weekend(i) data(i,1:p)];
end