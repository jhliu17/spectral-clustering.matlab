function [distance_matrix] = e_neighborhood(X, e)
% Finish a e-neighborhood graph calculating.For more details, see the 
% reference: von Luxburg(2006).A Tutorial on Spectral Clstering.
% input: X, [X_samples, X_features]; e, a threshold to decide whether
% connect to another vertix.
% return: distance_matrix, [X_samples, X_samples].

distance_matrix = euclidean_distances(X, X, false);
indexs = find(distance_matrix > e);
distance_matrix(indexs) = distance_matrix(indexs) * 0;
end

