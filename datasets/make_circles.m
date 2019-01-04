function [X, y] = make_circles(n_samples, shuffle, noise, random_state, factor_size)
% make_circles - Make a large circle containing a smaller circle in 2d.
% A simple toy dataset to visualize clustering and classification
% algorithms.

if factor_size > 1 || factor_size < 0
    error('factor_size has to be between 0 and 1.', A1)
end

% so as not to have the first point = last point, we add one and then
% remove it.
n = floor(n_samples / 2) + 1;
space = linspace(0, 2 * pi, n);
space = space(1:n-1);

outer_circ_x = cos(space);
outer_circ_y = sin(space);
inner_circ_x = outer_circ_x * factor_size;
inner_circ_y = outer_circ_y * factor_size;

X = [outer_circ_x, inner_circ_x; outer_circ_y, inner_circ_y]';
y = [ones(n - 1, 1); zeros(n - 1, 1)];

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