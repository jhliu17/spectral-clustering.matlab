function [distance_matrix] = cosine_distances(X, Y)
X_shape = size(X);
Y_shape = size(Y);
distance_matrix = zeros(X_shape(1), Y_shape(1));

for i = 1:X_shape(1)
    for j = 1:Y_shape(1)
        distance_matrix(i, j) = 1 - (X(i, :) * Y(j, :)') / (norm(X(i, :)) * norm(Y(j, :)));
    end
end
end
