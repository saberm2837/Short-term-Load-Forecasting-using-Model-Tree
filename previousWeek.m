function newData =previousWeek(data, load, n)
% Adds the value of the previous week same hour load as an input for each
% instance.
% Input : data = original data matrix
%       : load = column matrix containing load data
%       : n = # of selected rows from data matrix
% Output: newData = a new matrix after adding previous week load with given data

newData=[];
for i=145:n-24
    newData =[newData; load(i-144) data(i, :)];  
end