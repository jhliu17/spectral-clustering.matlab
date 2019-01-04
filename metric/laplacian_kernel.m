function [distance_matrix] = laplacian_kernel(X, Y, gamma)
if nargin < 3
    gamma = 1 / size(X, 2);
end
X_shape = size(X);
Y_shape = size(Y);
distance_matrix = zeros(X_shape(1), Y_shape(1));
for i = 1:X_shape(1)
    for j = 1:Y_shape(1)
        distance_matrix(i, j) = exp(-gamma * sum(abs(X(i, :) - Y(j, :))));
    end
end
end