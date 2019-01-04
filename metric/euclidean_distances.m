function [distance_matrix] = euclidean_distances(X, Y, square)
% A simple implementation of euclidean_distances
% input: X, [X_samples, X_features]; Y, [Y_samples, Y_features];
% return: distance_matrix, [X_samples, Y_samples].
X_shape = size(X);
Y_shape = size(Y);
distance_matrix = zeros(X_shape(1), Y_shape(1));

for i = 1:X_shape(1)
    for j = 1:Y_shape(1)
        distance_matrix(i, j) = norm(X(i, :) - Y(j, :));
    end
end

if square
    distance_matrix = distance_matrix .* distance_matrix;
end
end

