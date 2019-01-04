function [distance_matrix] = sigmoid_kernel(X, Y, gamma, coef0)
if nargin < 3
    gamma = 1 / size(X, 2);
    coef0 = 1;
elseif nargin == 3
    coef0 = 1;
end
X_shape = size(X);
Y_shape = size(Y);
distance_matrix = zeros(X_shape(1), Y_shape(1));
for i = 1:X_shape(1)
    for j = 1:Y_shape(1)
        distance_matrix(i, j) = 1./(1+exp(-(gamma * (X(i, :) * Y(j, :)') + coef0)));
    end
end
end