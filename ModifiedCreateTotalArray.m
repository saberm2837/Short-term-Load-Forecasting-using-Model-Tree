function ModifiedCreateTotalArray (data, size, forecastHorizon, filename)
%This function creates the various inputs and creates an ARFF file
% that is appropriate for use with the Weka.
% data = data in Excel format
% size = # of rows
% forecastHorizon = Varied between 1h to 168h to generate different
% datasets for different time horizon 
% filename = name of the arff file

% This file was created by Abby Martin and later modified by Mohammad Saber

iniAttName = ['Temp WindSp WindDir DewPt CC Precip Flow'];    % hr8 file initial attributes except 'Date'
iniDType = ['NUMERIC NUMERIC NUMERIC NUMERIC NUMERIC NUMERIC NUMERIC'];   % hr8 file initial data types of attributes 

% Creating exogenous terms ...

% sin(DOW) & sin(DOY)
matDate = createMD(data, size);  % Change Excel date to MATLAB date format
dataDoW = createDW(matDate,size);    % Assign day # (1-7) - Day Of the Week (DOW)
dataDoY = dayyear(matDate, size);    % Day of the year (1-365/366) - Day Of the Year (DOY)
sinDoW = createSinDW(dataDoW, size);  % sin(DOW)  
sinDoY = createSinDY(dataDoY, size);  % sin(DOY)
data1 = createSinArray(sinDoW, sinDoY,data, size);   % Add two sin(.) columns
attr = ['sin(DOW) sin(DOY) '];     % New calculated attributes
tempAttName = [attr iniAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType iniDType];    % New data types added

% cos(DOW) & cos(DOY)
cosDoW = createCosDW(dataDoW,size);    % cos(DOW)
cosDoY = createCosDY(dataDoY, size);   % cos(DOY)
data2 = createCosArray(cosDoW, cosDoY, data1, size);    % Add two cos(.) columns
attr = ['cos(DOW) cos(DOY) '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% Hour & Week
dataHr = createHourly(matDate, size);    % Hour (0-23)
dataWk = createWeekend(dataDoW, size);  % Weekend = 1, Weekday = 0
data3 = createHRWE(dataHr, dataWk, data2, size);    % Add Hour & Weekend/day
attr = ['Hr Wk '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

load = data(:,8);   % Extract load data from original dataset
temp = data(:,2);   % Extract temperature data from original dataset
% Lag term (laod of 24 hours ago)
if(forecastHorizon>=24)
    data4 = previousDay(data3, load, size);    % Add 24-hour ago Load
    attr = ['pdFlow '];     % New calculated attributes
    tempAttName = [attr tempAttName];           % New attributes added
    dataType = ['NUMERIC '];  % New calculated attributes' data type
    tempDType = [dataType tempDType];    % New data types added
else
    data4 = data3;
end

% Lag term (temperature of 24 hours ago)
data5 = pdtemp(data4, temp, size, forecastHorizon);     % Add previous day load
attr = ['pdTemp '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% temperature diffence betweeen today & yesterday
data6 = tempdif(data5,size);     % Add temperature difference between today and yesterday
attr = ['pdTempDiff '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% Lag term (load of 168 hours ago)
if(forecastHorizon>=168)
    data7 = previousWeek(data6,load, size);    % Add previous week's load
    attr = ['pwFlow '];     % New calculated attributes
    tempAttName = [attr tempAttName];           % New attributes added
    dataType = ['NUMERIC '];  % New calculated attributes' data type
    tempDType = [dataType tempDType];    % New data types added
else
    data7 = data6;
end

% Lag term (temperature of 168 hours ago)
data8 = pwtemp(data7, temp, size, forecastHorizon);     % Add previous week's temperature
attr = ['pwTemp '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% Temperature difference between today & last week
data9 = tempdifw(data8,size);       % Temperature difference between today & prevous week
attr = ['pwTempDiff '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% HDD65 & HDD55
data10 = HDD(data9,size);      % HDD65 & HDD55
attr = ['HDD65 HDD55 '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% CDD75 & CDD65
data11 = CDD(data10,size);        % CDD75 & CDD65. 
attr = ['CDD75 CDD65 '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% data11 is the final dataset.
dName = 'CenHud_ElectricLoad_hr8';     % Data Name
attName = strsplit(tempAttName);  % Attribute names for each column
dType = strsplit(tempDType);  % Data types of each attribute
finalData = data11(168-(forecastHorizon-1):size-168-(forecastHorizon-1),:);  % Data

arffwrite(filename,dName,attName,dType,finalData); % Write final matrix c into filename in arff format

end
