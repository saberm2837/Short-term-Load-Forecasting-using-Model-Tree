function newData = createWeekend(data, n)
% Creates a value for each instance as a representation of weekend or not
% as a value of 0 for weekday and 1 for weekend.
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix containing weekday=0/weekend=1

newData=[];
for i=1:n
    if(data(i)==1)
        newData=[newData; 1];
    elseif(data(i)==7)
        newData=[newData;1];
    else
        newData=[newData;0];
    end
end