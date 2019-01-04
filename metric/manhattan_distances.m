function [distance_matrix] = manhattan_distances(X, Y)
X_shape = size(X);
Y_shape = size(Y);
distance_matrix = zeros(X_shape(1), Y_shape(1));

for i = 1:X_shape(1)
    for j = 1:Y_shape(1)
        distance_matrix(i, j) = sum(abs(X(i, :) - Y(j, :)));
    end
end

% if threshold ~= false
%     distance_matrix(distance_matrix < threshold) = 0;
% end
end