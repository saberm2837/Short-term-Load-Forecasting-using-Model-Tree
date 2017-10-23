function newData = createMD(data, n)
% Changes the Excel date format to a Matlab date format
% Input : data = a matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix which contains date in matlab format

newData =[];
for i = 1:n
    newData =[newData; x2mdate(data(i,1))];
end

