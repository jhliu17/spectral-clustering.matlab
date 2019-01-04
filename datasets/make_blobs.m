function [X, y] = make_blobs(n_samples, centers, cluster_std, center_box, shuffle, random_state)
% Generate isotropic Gaussian blobs for clustering in 2D.
% A simple toy dataset to visualize clustering and classification
% algorithms.
if nargin == 2
    cluster_std = 1.0;
    center_box = [-10, 10];
    shuffle = true;
    random_state = 32;
elseif nargin == 3
    center_box = [-10, 10];
    shuffle = true;
    random_state = 32;
elseif nargin == 4
    shuffle = true;
    random_state = 32;
else
    random_state = 32;
end


center_loc = zeros(centers, 2);
rng(random_state);
center_loc(:, 1) = center_box(1) + (center_box(2) - center_box(1)) * rand(3, 1);
rng(random_state);
center_loc(:, 2) = center_box(1) + (center_box(2) - center_box(1)) * rand(3, 1);

X = zeros(n_samples, 2);
y = zeros(n_samples, 1);
idx = floor(n_samples / centers);
for i = 1:centers
    if i ~= centers
        for j = (idx * (i - 1) + 1):(idx * i)
            X(j, :) = center_loc(i, :);
            y(j, :) = i - 1;
        end
    else
        for j = (idx * (i - 1) + 1):n_samples
            X(j, :) = center_loc(i, :);
            y(j, :) = i - 1;
        end
    end
end

X = mvnrnd(X, cluster_std * eye(2, 2));
if shuffle
    rand_n = randperm(size(X, 1));
    X = X(rand_n, :);
    y = y(rand_n);
end
end