function [X, y] = make_SMSspam_dataset(n_sample, mode, tfidf, balance, shuffle)
% bi_gram is a flag to control whether to use the bi-gram feature.
if nargin == 1
    mode = 'w2v';
    tfidf = true;
    balance = true;
elseif nargin == 2
    tfidf = true;
    balance = true;
elseif nargin == 3
    balance = true;
end

% using sparse matrix for better loading speed
if strcmp(mode, 'w2v')
    data = load('SMSSpamCollection_w2v.mat');
    data = data.a;
elseif strcmp(mode, 'bi-gram')
    if tfidf == true
    data = load('SMSSpamCollection(TF_IDF)_bigram.mat');
    data = full(data.b);
    else
    data = load('SMSSpamCollection_bigram.mat');
    data = full(data.b);
    end
else
    if tfidf == true
    data = load('SMSSpamCollection(TF_IDF)-0.mat');
    data = full(data.b);
    else
    data = load('SMSSpamCollection-0.mat');
    data = full(data.b);
    end
end

column = size(data, 2);
X = data(:, 1:(column - 1));
y = data(:, column);

if balance == true && strcmp(n_sample, 'all') ~= true
    true_indexs = find(y==1);
    false_indexs = find(y==0);
    true_value = floor(n_sample / 2);
    false_value = n_sample - true_value;
    
    rand_index = randperm(true_value);
    true_indexs = true_indexs(rand_index);
    rand_index = randperm(false_value);
    false_indexs = false_indexs(rand_index);
    indexs = [true_indexs, false_indexs];
    X = X(indexs, :);
    y = y(indexs, :);
end

if shuffle
    rand_n = randperm(size(X, 1));
    X = X(rand_n, :);
    y = y(rand_n);
end
processed_X = [];
processed_y = [];
for i = 1:size(X, 1)
    if sum(X(i, :)) ~= 0
        processed_X = cat(1, processed_X, X(i, :));
        processed_y = cat(1, processed_y, y(i, :));
    end
end
       
X = processed_X;
y = processed_y;

end


