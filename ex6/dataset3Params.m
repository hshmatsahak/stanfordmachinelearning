function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
Cvals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmavals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
errors = zeros(length(Cvals),length(sigmavals));
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
for i=1:length(Cvals)
    for j = 1:length(sigmavals)
        curr_c = Cvals(i);
        curr_sigma = sigmavals(j);
        model = svmTrain(X, y, curr_c, @(x1, x2)gaussianKernel(x1, x2, curr_sigma));
        predictions = svmPredict(model, Xval);
        errors(i,j) = mean(double(predictions ~= yval));
    end
end
[Cmin, sigmamin] = find(ismember(errors, min(errors(:))));
C = Cvals(Cmin(1));
sigma = sigmavals(sigmamin(1));

% =========================================================================

end
