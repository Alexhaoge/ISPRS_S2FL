q = 0.9;
subplot(6, 6, 1);
s_train = sum(traindata, 1); quan = quantile(s_train, q);
tab=tabulate(TrainLabel(:,s_train>quan));
bar(tab(:,3));
title('Sum')

for i=1 : 30
    subplot(6,6,i+1);
    quan = quantile(traindata(i,:), q);
    tab = tabulate(TrainLabel(:,traindata(i,:)>quan));
    bar(tab(:,3));
    title(i)
end