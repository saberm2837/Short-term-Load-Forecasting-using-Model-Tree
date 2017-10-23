function newData = createSinDY(data, n)
% Assigns the instance a value for day of the year as a function of sine.
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix containing sin(DoY) of the given data
newData=[];
for i=1:n
    newData=[newData;sin(data(i)*2*pi/365)];
end