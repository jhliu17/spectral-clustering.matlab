function [distance_matrix] = rbf_kernel(X, Y, gamma)
if nargin < 3
    gamma = 1 / size(X, 2);
end
X_shape = size(X);
Y_shape = size(Y);
distance_matrix = zeros(X_shape(1), Y_shape(1));

for i = 1:X_shape(1)
    for j = 1:Y_shape(1)
        distance_matrix(i, j) = exp(-gamma * norm(X(i, :) - Y(j, :)) ^ 2);
    end
end

end