function [ev_fn_time, gefe_fn_time] = TimeToRetrieveRandomEigenvector(n, num_trials, eigenvector_function)  
% Quick benchmarking function to retrieve a random eigenvector for k consecutive trials with an n x n matrix.
%
% 'n' is the size of the Hermitian matrix. n > 0.
% 'num_trials' is the number of trials to be conducted. num_trials > 0.
% 'eigenvector_function' is a function that produces the eigenvectors of a
% matrix. Assumes that it returns a single argument, a matrix (or vector) of
% corresponding eigenvalues.
%
% Returns: The time required to run all k trials for both the provided function in [ev_fn_time]
% and GEFE in [gefe_fn_time].
%
% NOTE 1: GetEigenvectorFromEigenvalues() produces the normed eigenvector value. This may not
% always be the case for @eigenvector_function.
%
% NOTE 2: Currently disregards precision!
%
% Example usage: 
%               n = 10;
%               number_of_trials = 100;
%               [y1, y2] = time_trials(n, number_of_trials, @eig);

    H = randn(n,n); 
    H = (H+H')/2;
    
    disp('-------------------------------------------------------');
    fprintf('   1. n = %d\n   2. num_trials = %d\n', n, num_trials);
    disp(' ... ');
    
    fprintf('   Computing contesting eigenvector function: %s \n', func2str(eigenvector_function));
    ev_fn = @() RunTrialsEigenvectorFunction(H, n, num_trials, eigenvector_function);
    ev_fn_time = timeit(ev_fn);
    
    disp(' ... ');
    
    fprintf('   Computing GetEigenvectorFromEigenvalues \n');
    gefe_fn = @() RunTrialsGEFEFunction(H, n, num_trials);
    gefe_fn_time = timeit(gefe_fn);
    
    disp('-----------------------------------------------------');
end


function RunTrialsEigenvectorFunction(H, n, num_trials, eigenvector_function)
    for k = 1:num_trials
        [eigenvectors, ~] = eigenvector_function(H);
        eig_rand_eigenvector = eigenvectors(:, randi([1 n]));
    end
end


function RunTrialsGEFEFunction(H, n, num_trials)
    eigvals = eig(H);
    ii = 1:n;
    for k = 1:num_trials
        gefe_rand_eigenvector = GetEigenvectorFromEigenvalues(H, ii, randi([1 n]), eigvals);
    end
end
