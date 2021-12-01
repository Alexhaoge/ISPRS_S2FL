function [] = histFeat(data, name)
%HISTFEAT Summary of this function goes here
%   Detailed explanation goes here
s = size(data, 1);
r = ceil(s / sqrt(s));
c = ceil(s / r);
for i = 1 : s(1)
    subplot(r,c,i)
    histfit(data(i,:));
end
sgtitle(name);
shg
end

