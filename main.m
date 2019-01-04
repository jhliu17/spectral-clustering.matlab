%% Spectral Clustering 
% Course: Big Data Analysis and Applications
% Author: Liu Junhao

clear;
clc;
% Load the Spectral Clustering Tools written by myself. This toolbox
% includes the datasets which is common in machine learning research especially
% clustering and the api seems like the popurlor machine learning package
% Scikit Learn. You can qucikly start to your spectral clustering method.
addpath('datasets')
addpath('metric')
addpath('solver')
addpath('graph')
addpath('utils')

%% 1. Prepare data



%% 2. backup
%[X, y] = make_seeds_dataset('all', true);
%[X, y] = make_digits_dataset(800, false, false);
% [X, y] = make_SMSspam_dataset(300, 'bi-gram', true, true, false);
% % X = mapstd(X')';
% % [X, ~] = normalization(X);
% % [X, y] = make_circles(150, false, 0.02, 10, 0.55); 
% W = nearest_neighbor(X, 30, true);% using unmutual mode can get a better perfoemance???
% % W = fullyconnected(X, 1, 'rbf');
% 
% [C, L, U] = SpectralClustering(W, size(unique(y), 1), 2);
% rng(568);
% options.MaxIter = 8000;
% Y = tsne(X,'Algorithm','barneshut','NumPCAComponents', 1000, 'Distance', 'cosine','Options', options);
% figure
% gscatter(Y(:,1), Y(:,2), y);
% grid on;
% figure
% gscatter(Y(:,1), Y(:,2), C);
% adjusted_rand_score(y, C)
% grid on;

%% backup
% [X, y] = make_SMSspam_dataset(300, 'w2v', true, true, false);
% % X = mapstd(X')';
% % [X, ~] = normalization(X);
% % [X, y] = make_circles(150, false, 0.02, 10, 0.55); 
% W = nearest_neighbor(X, 8, false);% using unmutual mode can get a better perfoemance???
% % W = fullyconnected(X, 1, 'rbf');
% 
% [C, L, U] = SpectralClustering(W, size(unique(y), 1), 2);
% rng(568);
% options.MaxIter = 8000;
% Y = tsne(X,'Algorithm','barneshut','NumPCAComponents', 50, 'Distance', 'cosine','Options', options);
% figure
% gscatter(Y(:,1), Y(:,2), y);
% grid on;
% figure
% gscatter(Y(:,1), Y(:,2), C);
% adjusted_rand_score(y, C)
% grid on;

%% back up
[X, y] = make_seeds_dataset(200, false);
% X = mapstd(X')';
% [X, ~] = normalization(X);
% [X, y] = make_circles(150, false, 0.02, 10, 0.55); 
% W = nearest_neighbor(X, 8, false);% using unmutual mode can get a better perfoemance???
W = fullyconnected(X, 1, 'laplacian');

[C, L, U] = SpectralClustering(W, size(unique(y), 1), 2);
rng(568);
options.MaxIter = 8000;
Y = tsne(X,'Algorithm','barneshut','NumPCAComponents', 4,'Options', options);
figure
gscatter(Y(:,1), Y(:,2), y);
grid on;
figure
gscatter(Y(:,1), Y(:,2), C);
adjusted_rand_score(y, C)
grid on;

a = similarity_matrix(W, C, true);
figure
imshow(a, bone)