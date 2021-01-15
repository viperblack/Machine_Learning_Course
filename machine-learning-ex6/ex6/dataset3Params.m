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
values = [0.01 0.03 0.1 0.3 1 3 10 30];
error_min = inf;
count = 0;
size = length(values)^2;
t0 = clock ();

%Additional (cosmetic need) function to display completion of training
function print_footer
percentage = (count / size) * 100;

  fprintf("+------------------------------------+ \n");
  fprintf("Sigma: %.2f \nError %.2f \nCompleted: %d of %d (%.2f%%)\n", sigma, err, count, size, percentage);
  fprintf("Time elapsed: %.2f s \n", eta);
  fprintf("+------------------------------------+ \n");
  
endfunction

%Choosing and testing values for sigma and error
  for C = values
    
    for sigma = values
      model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
      err = mean(double(svmPredict(model, Xval) ~= yval));
      if( err <= error_min )
        C_final = C;
        sigma_final = sigma;
        error_min = err;
        ++count;
        eta = etime (clock (), t0);
        print_footer();    
      else
        ++count;
        eta = etime (clock (), t0);
        print_footer();
      endif
    endfor 
  endfor

C = C_final;
sigma = sigma_final;


% =========================================================================

end
