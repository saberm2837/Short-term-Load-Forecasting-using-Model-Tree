function newData = dayyear(data, n)
% This function assigns day of the year based on leap year or not, value
% 1 to 365/366.
% Input : data = a column matrix
%       : n = # of selected rows from data matrix
% Output: newData = a column matrix containing day of the year

 newData = [];
 for i=1:n
     year = str2double(datestr(data(i,1),'yyyy'));
     month = datestr(data(i,1),'mmm');
     day = str2double(datestr(data(i,1),'dd'));
     if((0==mod(year,4)&&((~(0==mod(year,100)))||(0==mod(year,400)))))
         if(1 == findstr(month, 'Jan'))
             newData=[newData; day];
         elseif(1==findstr(month,'Feb'))
             newData=[newData; day+31];
         elseif(1==findstr(month,'Mar'))
             newData=[newData; day+60];
         elseif(1==findstr(month,'Apr'))
             newData=[newData; day+91];
         elseif(1==findstr(month,'May'))
             newData=[newData; day+121];
         elseif(1==findstr(month,'Jun'))
             newData=[newData; day+152];
         elseif(1==findstr(month, 'Jul'))
             newData=[newData; day+182];
         elseif(1==findstr(month, 'Aug'))
             newData=[newData; day+213];
         elseif(1==findstr(month, 'Sep'))
             newData=[newData; day+244];
         elseif(1==findstr(month, 'Oct'))
             newData=[newData; day+274];
         elseif(1==findstr(month, 'Nov'))
             newData=[newData; day+305];
         elseif(1==findstr(month,'Dec'))
             newData=[newData; day+335];
         end
     else
        if(1 == findstr(month, 'Jan'))
             newData=[newData; day];
         elseif(1==findstr(month,'Feb'))
             newData=[newData; day+31];
         elseif(1==findstr(month,'Mar'))
             newData=[newData; day+59];
         elseif(1==findstr(month,'Apr'))
             newData=[newData; day+90];
         elseif(1==findstr(month,'May'))
             newData=[newData; day+120];
         elseif(1==findstr(month,'Jun'))
             newData=[newData; day+151];
         elseif(1==findstr(month, 'Jul'))
             newData=[newData; day+181];
         elseif(1==findstr(month, 'Aug'))
             newData=[newData; day+212];
         elseif(1==findstr(month, 'Sep'))
             newData=[newData; day+243];
         elseif(1==findstr(month, 'Oct'))
             newData=[newData; day+273];
         elseif(1==findstr(month, 'Nov'))
             newData=[newData; day+304];
         elseif(1==findstr(month,'Dec'))
             newData=[newData; day+334];
        end 
     end
end
