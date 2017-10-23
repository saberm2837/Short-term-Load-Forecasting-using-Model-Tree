function newData = createHourly(data, n)
% Creates a value for each instance as a representation of the hour
% as a value from 0 to 23.
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix containing hours (0-23) of the day

newData=[];
for i=1:n
    newData = [newData;(data(i)-floor(data(i)))*24];
end
