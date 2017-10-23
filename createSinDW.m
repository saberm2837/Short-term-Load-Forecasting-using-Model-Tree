function newData = createSinDW(data, n)
% Assigns the instance a value for day of the week as a function of sine.
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix containing sin(DoW)of the given data
newData = [];
for i=1:n
    newData = [newData;sin(data(i)*2*pi/7)];
end
