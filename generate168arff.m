function generate168arff(data)
% This function generates 168 datasets and create arff file for each
% dataset

% [sz,~] = size(data);
extra = 168*2-1; % 335 extra data points added for generating exogenous     
% terms (168) and creating alignment for 168 hours time horizon (167)
tr_sz = 35064+extra;  % 4 years of hourly data (including leap year)
ts_sz = 8760;   % 1 years of hourly data

tr_data = data(1:tr_sz,:);
ts_data = data(tr_sz-334:tr_sz+ts_sz,:);
    
% for i=1:168
%     fname = strcat('train',num2str(i),'.arff');
%     disp(strcat('Generating training model#',num2str(i),'...'));
%     ModifiedCreateTotalArray (tr_data, tr_sz, i, fname);
% end
profile on;
for i=1:6
    fname = strcat('test',num2str(i),'.arff');
    disp(strcat('Generating testing model#',num2str(i),'...'));
    ModifiedCreateTotalArray (ts_data, ts_sz+extra, i, fname);
end
profile viewer
end

