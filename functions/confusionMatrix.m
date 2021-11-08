function [conmat, oa, pa, ua, kappa] = confusionMatrix(label, predict)
%confusionMatrix Compute confusion matrix, overall accuracy, producer
%accuracy(recall), user accuracy(precision)
%   Detailed explanation goes here
conmat = confusionmat(label, predict);
oa = sum(diag(conmat), 'ALL') / sum(conmat, 'ALL');
pa = diag(conmat) ./ sum(conmat, 2);
ua = diag(conmat) ./ sum(conmat, 1)';
n = sum(conmat, 'ALL');
p0 = sum(diag(conmat)) / n;
pe = sum(sum(conmat, 2) .* sum(conmat, 1)')/n^2;
kappa = (p0-pe)/(1-pe);
end

