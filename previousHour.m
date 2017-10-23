function h=previousHour(c, data, size)
% Adds the value of the previous hour load as an input for each
% instance.
h=[];
for n=1:size-168
    h=[h; data(n+167,13) c(n, 1:23)];
end
end