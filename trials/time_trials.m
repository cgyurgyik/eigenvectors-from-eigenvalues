function time_trials(n, num_trials, eigenvector_function)
% Quick benchmarking function to retrieve a random eigenvector for k consecutive trials with an n x n matrix.
%
% 'n' is the size of the Hermitian matrix. n > 0.
% 'num_trials' is the number of trials to be conducted. num_trials > 0.
% 'eigenvector_function' is a function that produces the eigenvectors of a
% matrix. Assumes that it returns a single argument, a matrix (or vector) of
% corresponding eigenvalues.
%
% Side note: GetEigenvectorFromEigenvalues() produces the normed eigenvector value. This may not
% always be the case for @eigenvector_function.
%
% Example usage: time_trials(100, 10, @eig);
% TODO(cgyurgyik): Save times to allow for data plots.

    H = randn(n,n);
    H = (H+H')/2;
    
    disp('-------------------------------------------------------');
    fprintf('   1. n = %d\n   2. num_trials = %d\n', n, num_trials);
    disp('------------------------------------');
    
    fprintf('   Contesting eigenvector function: %s\n', func2str(eigenvector_function));
    tic;
    for k = 1:num_trials
        % TODO(cgyurgyik): Write helper function, use MATLAB's timeit
        [eigenvectors, ~] = eigenvector_function(H);
        eig_rand_eigenvector = eigenvectors(:, randi([1 n]));
    end
    toc;
    
    disp('------------------------------------');
    
    fprintf('   GetEigenvectorFromEigenvalues\n');
    tic;
    eigvals = eig(H);
    ii = 1:n;
    for k = 1:num_trials
        gefe_rand_eigenvector = GetEigenvectorFromEigenvalues(H, ii, randi([1 n]), eigvals);
    end
    toc;
    
    disp('-----------------------------------------------------');
end
