function [distance_matrix] = fullyconnected(X, theta, kernel_type, coef0, n_degree)
% Finish a fully connected neighbor graph calculating.For more details, see the 
% reference: von Luxburg(2006).A Tutorial on Spectral Clstering.
% input: X, [X_samples, X_features]; theta, exp(-||xi-xj||^2/(2*theta^2)).
% return: distance_matrix, [X_samples, X_samples].
if nargin < 3
    kernel_type = 'rbf';
    coef0 = 1;
    n_degree = 3;
elseif nargin < 4
    coef0 = 1;
    n_degree = 3;
elseif nargin == 4
    n_degree = 3;
end

if strcmp(kernel_type,'rbf')
    distance_matrix = rbf_kernel(X, X, 1 / (2 * theta^2 ));
elseif strcmp(kernel_type,'laplacian')
    distance_matrix = laplacian_kernel(X, X, 1 / (2 * theta^2 ));
elseif strcmp(kernel_type,'sigmoid')
    distance_matrix = sigmoid_kernel(X, X, 1 / (2 * theta^2 ), coef0);
else
    distance_matrix = polynomial_kernel(X, X, n_degree, 1 / (2 * theta^2 ), coef0);
end

end