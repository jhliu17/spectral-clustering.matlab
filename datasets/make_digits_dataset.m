function [X, y] = make_digits_dataset(n_sample, balance, shuffle)
digit_data = importdata('optdigits.tra');
X = digit_data(:,1:64);
y = digit_data(:, 65);

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