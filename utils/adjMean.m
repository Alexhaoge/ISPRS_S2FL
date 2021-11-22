function Xs = adjMean(X)
%ADJMEAN Mean pooling with adjacent pixels
%   X input 3D images
%   func function to apply on each pixels and adjacent blocks
dim = size(X);
Xs = zeros(dim);
for k = 1 : dim(3)
    for i = 1 : dim(1)
        for j = 1 : dim(2)
            Xs(i, j, k) = mean(X(max(i-1, 1):min(i+1, dim(1)), max(j-1, 1):min(j+1, dim(2)), k), 'ALL');
        end
    end
end
end

