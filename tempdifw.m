function newData = tempdifw(data, n)
% Adds the value of the difference between the previous week same hour  
% temperature and the current temperature as an input for each instance.
% Input : data = original data matrix
%       : n = # of selected rows from data matrix
% Output: newData = a new matrix after adding temperature difference between
%       : today and last week with given data

newData=[];
[~,p] = size(data); % p = # of columns in data matrix
for i=1:n-168
    newData = [newData; data(i,1)-data(i,p-6) data(i, 1:p)];
end