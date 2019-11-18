function [avg_rel_tol, avg_abs_tol] = DetermineAverageEigenvectorPrecision(N, number_of_trials)
% Determines the average relative tolerance and average absolute tolerance
% for eigenvector production across an N x N Hermitian matrix.
% To reduce outliers, this is conducted over k trials, where k = number_of_trials.
% The comparison occurs between MATLAB's eig() and GetEigenvectorFromEigenvalues().

    H = randn(N,N);
    H = (H+H')/2;

    rel_tol = zeros(N,N);
    abs_tol = zeros(N,N);
    
    for k = 1:number_of_trials
        [eig_ev, ~] = eig(H);
        eig_ev = eig_ev.^2;
        
        gefe_ev = GetAllEigenvectorsFromEigenvalues(H)';
        
        rel_tol = rel_tol + abs(eig_ev - gefe_ev) ./ min(abs(eig_ev), abs(gefe_ev));
        abs_tol = abs_tol + abs(eig_ev - gefe_ev);
    end
    
    rel_tol_avg_over_trials = rel_tol ./ number_of_trials;
    abs_tol_avg_over_trials = abs_tol ./ number_of_trials;
    
    avg_rel_tol = sum(sum(rel_tol_avg_over_trials)) / (N * N);
    avg_abs_tol = sum(sum(abs_tol_avg_over_trials)) / (N * N);
end
