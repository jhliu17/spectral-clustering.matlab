function [X, y] = make_moons(n_samples, shuffle, noise, random_state)
% make_moons - Make two interleaving half circles.
% A simple toy dataset to visualize clustering and classification
% algorithms.
% It hasn't been finished, to be done!!!


n_samples_out = floor(n_samples / 2);
n_samples_in = n_samples - n_samples_out;
rng(random_state);

outer_circ_x = cos(linspace(0, pi, n_samples_out));
outer_circ_y = sin(linspace(0, pi, n_samples_out));
inner_circ_x = 1 - cos(linspace(0, pi, n_samples_in));
inner_circ_y = 1 - sin(linspace(0, pi, n_samples_in)) - .5;

X = [outer_circ_x, inner_circ_x; outer_circ_y, inner_circ_y]';
y = [ones(n_samples_out, 1); zeros(n_samples_in, 1)];

if shuffle
    rand_n = randperm(size(X, 1));
    X = X(rand_n, :);
    y = y(rand_n);
end

if noise ~= 0
    rng(random_state);
    X = X + noise * randn(size(X));
end

end