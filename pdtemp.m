function newData = pdtemp(data, temp, n, horizon)
% Adds the value of the previous day same hour temperature as an input for 
% each instance.
% Input : data = original data matrix
%       : temp = column matrix containing temperature data
%       : n = # of selected rows from data matrix
%       : horizon = forecast horizon (1-168)
% Output: newData = a new matrix after adding previous day temperature with 
%       : given data

newData =[];
if(horizon>=24)
    for i=1:n-24
       newData = [newData; temp(i) data(i,:)];
    end
else
    for i=25:n
        newData = [newData; temp(i-24) data(i,:)];
    end
end