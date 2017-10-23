function newData=CDD(data, n)
% This function adds 75 and 65 cooling degree days to each instance.
% HDD65 = 65-temp (if temp>=65), otherwise 0.
% HDD55 = 55-temp (if temp>=55), otherwise 0.
% Input : data = original data matrix
%       : n = # of selected rows from data matrix
% Output: newData = a matrix after adding CDD75 & CDD65 columns with given data

c=[];
newData=[];
[~,p] = size(data); % p = # of colums in data matrix
for i=1:n-168
    if(data(i,p-6)>75)
        c=[c; (data(i,p-6)-75) data(i,1:p)];
    else
        c=[c; 0 data(i,1:p)];
    end
end
p = p+1;    % One column added with previous # of columns
for i=1:n-168
    if(c(i,p-6)>65)
        newData=[newData; (c(i,p-6)-65) c(i, 1:p)];
    else 
        newData=[newData; 0 c(i, 1:p)];
    end
end
end