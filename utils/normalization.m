function [X, features_mean, features_std] = normalization(X_old, x_mean, x_std)
if nargin == 1
    features_mean = mean(X_old, 1);
    features_std = std(X_old, 1);
    X = mapstd(X_old')';
else
    X = X - x_mean;
    X = X ./ x_std;
    features_mean = x_mean;
    features_std = x_std;
end