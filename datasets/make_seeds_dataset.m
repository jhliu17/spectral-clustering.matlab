function [X, y] = make_seeds_dataset(n_sample, shuffle)
seed_data = textread('seeds_dataset.txt');
X = seed_data(:,1:7);
y = seed_data(:, 8) - 1;

if shuffle
    rand_n = randperm(size(X, 1));
    X = X(rand_n, :);
    y = y(rand_n);
end

if strcmp(n_sample, 'all') ~= true
    n_sample = round(n_sample);
    X = X(1:n_sample, :);
    y = y(1:n_sample, :);
end
end