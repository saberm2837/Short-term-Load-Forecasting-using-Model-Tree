function newData = createCosDY(data, n)
% Assigns the instance a value for day of the year as a function of cosine.
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix containing cos(DoY) of the given data
newData=[];
for i=1:n
    newData=[newData;cos(data(i)*2*pi/365)];    % What about 366 days year?
end