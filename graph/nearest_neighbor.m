function [distance_matrix] = nearest_neighbor(X, k, mutual, distance_type)
% Finish a k-nearest neighbor graph calculating.For more details, see the 
% reference: von Luxburg(2006).A Tutorial on Spectral Clstering.
% input: X, [X_samples, X_features]; k, the k nearest neighbor of a
% vertix; mutual, true/fasle: whether return a mutual k-nearest neighbor
% graph.
% return: distance_matrix, [X_samples, X_samples].
if nargin < 4
    distance_type = 'e';
end

if strcmp(distance_type, 'e')
    distance_matrix = euclidean_distances(X, X, false);
elseif strcmp(distance_type, 'c')
    distance_matrix = cosine_distances(X, X);
elseif strcmp(distance_type, 'm')
    distance_matrix = manhattan_distances(X, X);
end
row_k_nearest_matrix = zeros(size(distance_matrix));

for i = 1:size(distance_matrix, 1)
    [~, r_id] = sort(distance_matrix(i, :));
    r_id = r_id(2 : k + 1); % not include self
    row_k_nearest_matrix(i, r_id) = 1;
end

if mutual    
    k_nearest_matrix = (row_k_nearest_matrix + row_k_nearest_matrix')/2;
    k_nearest_matrix(find(k_nearest_matrix == 1/2)) = 0;
else
    k_nearest_matrix = row_k_nearest_matrix;
end

distance_matrix = distance_matrix .* k_nearest_matrix;
end

