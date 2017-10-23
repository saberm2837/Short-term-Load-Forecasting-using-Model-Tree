function newData =previousDay(data, load, n)
% Adds the value of the previous day same hour load as an input for each
% instance.
% Input : data = original data matrix
%       : load = column matrix containing load data
%       : n = # of selected rows from data matrix
% Output: newData = a new matrix after adding previous day load with given data

newData =[];
for i=25:n
    newData = [newData; load(i-24) data(i,:)];
end

