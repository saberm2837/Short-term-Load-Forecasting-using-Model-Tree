function newData = HDD(data, n)
% This function adds 65 and 55 heating degree days to each instance.
% HDD65 = 65-temp (if temp>=65), otherwise 0.
% HDD55 = 55-temp (if temp>=55), otherwise 0.
% Input : data = original data matrix
%       : n = # of selected rows from data matrix
% Output: newData = a matrix after adding HDD65 & HDD55 columns with given data

h=[];
newData=[];
[~,p] = size(data); % p = # of colums in data matrix
for i=1:n-168
    if(data(i,p-6)<65)
        h=[h;(65-data(i,p-6)) data(i,1:p)];
    else
        h=[h;0 data(i,1:p)];
    end
end
p = p+1;    % One column added with previous # of columns
for i=1:n-168
    if(h(i,p-6)<55)
        newData=[newData; (55-h(i,p-6)) h(i,1:p)];
    else
        newData=[newData; 0 h(i,1:p)];
    end
end
end