function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = .3;
sigma = 0.1;

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

if(0)
minerror = inf;
vals = [0.01 0.03 0.1 0.3 1 3 10 30];
fprintf('find min prediction error\n');
for C = vals
  for sigma = vals
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, s));
    err = mean(double(svmPredict(model, Xval) ~= yval));
%    fprintf('c, s, e: %f, %f, %f\n', c, s, e);
    if( err <= minerror )
      fprintf('# new min found C, sigma, error: %f %f %f\n', Cfinal, sigmafin, minerror);
      Cfinal = C;
      sigmafin = sigma;
      minerror = err;
    end
  end
end
fprintf('final C, sigma, min_error: %f %f %f\n', C, sigma, minerror);
% final C, sigma, min_error: 1.000000 0.100000 0.030000
endif







% =========================================================================

end
