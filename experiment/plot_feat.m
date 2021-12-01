%% Plot top feature vs label class
q = 0.9;
subplot(6, 6, 1);
s_train = sum(traindata, 1); quan = quantile(s_train, q);
tab=tabulate(TrainLabel(:,s_train>quan));
bar(tab(:,3));
title('Sum');

for i=1 : 30
    subplot(6,6,i+1);
    quan = quantile(traindata(i,:), q);
    tab = tabulate(TrainLabel(:,traindata(i,:)>quan));
    bar(tab(:,3));
    title(i);
end
shg
%% Plot histogram and empirical pdf by channel
addpath("utils");

histFeat(traindata, 'Train data');
histFeat(testdata, 'Test data');

histFeat(f_hsi(:, 1 : size(SP_1, 2)), 'Train Data Modal 1 share+specific feature');
histFeat(f_hsi(:, 1 + size(SP_1, 2) : end), 'Train Data Modal 2 share+specific feature');

histFeat(theta00 * [SP_1, SP_2], 'Train data share feature');
histFeat(theta00 * SP_1, 'Train data Modal 1 share feature');
histFeat(theta00 * SP_2, 'Train data Modal 2 share feature');

histFeat(f_msi(:, 1 : size(SP_3, 2)), 'Test Data Modal 1 S2F');
histFeat(f_msi(:, 1 + size(SP_3, 2) : end), 'Test Data Modal 2 S2F');

histFeat(theta00 * [SP_3, SP_4], 'Test data share feature');
histFeat(theta00 * SP_3, 'Test data Modal 1 share feature');
histFeat(theta00 * SP_4, 'Test data Modal 2 share feature');

%% histogram for raw data
histFeat(traindata_SP_hsi, 'train HSI');
histFeat(traindata_SP_msi, 'train MSI');
histFeat(testdata_SP_hsi, 'test HSI');
histFeat(testdata_SP_msi, 'test MSI');

histFeat(traindata_SP_hsi, 'train HSI');
%% histogram by class
histFeat(traindata_SP_hsi(:,TrainLabel==1), 'train HSI class 1');
histFeat(traindata(:, TrainLabel==1), 'Train data class 1');

%% Covariance heatmap
heatmap(cov(traindata'))
