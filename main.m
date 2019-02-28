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


[X, y] = make_seeds_dataset(200, false);
W = fullyconnected(X, 1, 'laplacian');

[C, L, U] = SpectralClustering(W, size(unique(y), 1), 2);
rng(568);
options.MaxIter = 8000;
Y = tsne(X, 'Algorithm', 'barneshut', 'NumPCAComponents', 4,'Options', options);

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
