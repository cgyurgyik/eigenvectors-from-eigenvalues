function avg_abs_tol = DetermineAverageEigenvectorPrecision(N, number_of_trials)
% Determines average absolute tolerance for a random eigenvector in an N x N Hermitian matrix.
% To reduce outliers, this is conducted over k trials, where k = number_of_trials.
% The comparison occurs between MATLAB's eig() and GetEigenvectorFromEigenvalues().

    H = randn(N,N);
    H = (H+H')/2;

    abs_tol = zeros(N);
    
    fprintf('Computing absolute tolerance for random eigenvector in %d x %d Matrix.\n', N, N);
    fprintf('...\n');
    for k = 1:number_of_trials
        rand_ev = randi([1 N]);
        [eig_ev, ~] = eig(H);
        eig_ev = eig_ev.^2;
        eig_nth_ev = eig_ev(rand_ev, :);
        
        gefe_ev = GetEigenvectorFromEigenvalues(H, 1:N, rand_ev)';
        
        abs_tol = abs_tol + abs(eig_nth_ev - gefe_ev);
    end
    
    abs_tol_avg_over_trials = abs_tol ./ number_of_trials; % Divide by number of trials.
    % Take average absolute tolerance of ev(1n), ev(2n), ..., ev(nn).
    avg_abs_tol = sum(sum(abs_tol_avg_over_trials)) / N;
    
    fprintf('%d x %d Matrix complete.\n', N, N);
end
