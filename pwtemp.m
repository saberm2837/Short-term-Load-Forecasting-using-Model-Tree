function newData = pwtemp(data, temp, n, horizon)
% Adds the value of the previous week same hour temperature as an input for 
% each instance.
% Input : data = original data matrix
%       : temp = column matrix containing temperature data
%       : n = # of selected rows from data matrix
%       : horizon = forecast horizon (1-168)
% Output: newData = a new matrix after adding previous week temperature with 
%       : given data

newData=[];
if(horizon>=168)
    for i=1:n-168
        newData =[newData; temp(i) data(i, :)];
    end
else
    for i=145:n-24
        newData = [newData; temp(i-144) data(i,:)];
    end
end
    
    