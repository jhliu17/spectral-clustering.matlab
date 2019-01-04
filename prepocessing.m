% prepocess the SMS dataset to sparse matrix for faster reading
clc;
clear;
csv_files = {'SMSSpamCollection_bigram-1', 'SMSSpamCollection(TF_IDF)_bigram-1'};

for i = 1:4
    a = load([csv_files{i}, '.csv']);
    b = sparse(a);
    save([csv_files{i}, '.mat'], 'b');
end