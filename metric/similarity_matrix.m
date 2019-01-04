function [final_matrix] = similarity_matrix(X, C, normalize, distance_type)
% reconstruction for W input
% matrix = zeros(size(W));
% cluster = unique(C);
% num = 0;
% id = [];
% for i = 1:size(cluster, 1)
%     id = [id; find(C == cluster(i))];
% end
% for i = 1:size(matrix, 1)
%    matrix(:, i) = W(id(i), id);
% end

if nargin < 4
    distance_type = 'e';
end
matrix = zeros(size(X, 1), size(X, 2));
num = 0;
cluster = unique(C);
for i = 1:size(cluster, 1)
    id = find(C == cluster(i));
    for j = 1:size(id, 1)
        matrix(num + j, :) = X(id(j), :);
    end
    num = num + size(id, 1);
end

if strcmp(distance_type, 'e')
    distance_matrix = euclidean_distances(matrix, matrix, false);
elseif strcmp(distance_type, 'c')
    distance_matrix = cosine_distances(matrix, matrix);
elseif strcmp(distance_type, 'm')
    distance_matrix = manhattan_distances(matrix, matrix);
end
final_matrix = distance_matrix;
if normalize
    for i = 1:size(final_matrix, 1)
        min_ = min(final_matrix(i, :));
        max_ = max(final_matrix(i, :));
        for j = 1:size(final_matrix, 2)
            final_matrix(i, j) = 1 - (final_matrix(i, j) - min_) / (max_ - min_);
        end
    end
%     final_matrix = 1 - final_matrix;
end
end