function pw=createTotalArray (data, size, filename)
%This function creates the various inputs and creates an ARFF file
% that is appropriate for use with the Weka.
% data = data in Excel format
% size = # of rows
% filename = name of the arff file
iniAttName = ['Temp WindSp WindDir DewPt CC Precip Flow'];    % hr8 file initial attributes except 'Date'
iniDType = ['NUMERIC NUMERIC NUMERIC NUMERIC NUMERIC NUMERIC NUMERIC'];   % hr8 file initial data types of attributes 

dataMD = createMD(data, size);  % Change Excel date to MATLAB date format
dataDW1 = createDW(dataMD,size);    % Assign day # (1-7) - Day Of the Week (DOW)
dataDY1 = dayyear(dataMD, size);    % Day of the year (1-365/366) - Day Of the Year (DOY)
dataDW = createSinDW(dataDW1, size);  % sin(DOW)  
dataDY = createsinDY(dataDY1, size);  % sin(DOY)
sinArray = createSinArray(dataDW, dataDY,data, size);   % Add two sin(.) columns
attr = ['sin(DOW) sin(DOY) '];     % New calculated attributes
tempAttName = [attr iniAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType iniDType];    % New data types added

dataDWC = createCosDW(dataDW1,size);    % cos(DOW)
dataDYC = createCosDY(dataDY1, size);   % cos(DOY)
cosArray = createCosArray(dataDWC, dataDYC, sinArray, size);    % Add two cos(.) columns
attr = ['cos(DOW) cos(DOY) '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

dataHR = createHourly(dataMD, size);    % Hour (0-23)
dataWE = createWeekend(dataDW1, size);  % Weekend = 1, Weekday = 0
dataNew = createNew(dataHR, dataWE, size, cosArray);    % Add Hour & Weekend/day
attr = ['HR WE '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

PD = previousDay(dataNew, size);    % Add 24-hour ago Load
attr = ['preDay '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

pdt = pdtemp(PD, dataNew,size);     % Add previous day load
attr = ['pdTemp '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

td = tempdif(pdt,size);     % Add temperature difference between today and yesterday
attr = ['tempDiff '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

pw = previousWeek(td,dataNew, size);    % Add previous week's load
attr = ['preWeek '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

pwt = pwtemp(pw,dataNew, size);     % Add previous week's temperature
attr = ['pwTemp '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added


td2 = tempdifw(pwt,size);       % Temperature difference between today & prevous week
attr = ['tempDiffW '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

h = HDD(td2,size);      % HDD65 & HDD55
attr = ['HDD65 HDD55 '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

c = CDD(h,size);        % CDD75 & CDD65. 
attr = ['CDD75 CDD65 '];     % New calculated attributes
tempAttName = [attr tempAttName];           % New attributes added
dataType = ['NUMERIC NUMERIC '];  % New calculated attributes' data type
tempDType = [dataType tempDType];    % New data types added

% c is the final dataset. 23 columns in it.
dName = 'CenHud_ElectricLoad_hr8';     % Data Name
attName = strsplit(tempAttName);  % Attribute names for each column
dType = strsplit(tempDType);  % Data types of each attribute
finalData = c;  % Data
% attName = ['Date, ' tempAttName];   % Attribute Name for each variable
% dType = ['date , ' tempDType];     % Data type for ecah variable
arffwrite(filename,dName,attName,dType,finalData); % Write final matrix c into filename in arff format
end
