% Calculating eigenvectors from eigenvalues.
% For more information on proof, see: https://arxiv.org/pdf/1908.03795.pdf

% Gets the normed eigenvector ||v(i,j)||^2 from the matrix H.
% 'H' must be an N x N matrix.
% 'i' is the row.    1 <= i <= N.
% 'j' is the column. 1 <= j <= N.
function v_ij = getEigenvectorFromEigenvalues(H, i, j)
     % 1. Calculate the eigenvalues of λi(H).
     H_eigenvalues = eig(H);
     
     % 2. Calculate eigenvalues of hj 
     hj = H;
     hj(:, j) = []; % Remove jth column.
     hj(j, :) = []; % Remove jth row.
     hj_eigenvalues = eig(hj);
     
     ith_eigenvalue = H_eigenvalues(i);
     
     % 3a. res_A = res_A * [λi(H) - λk(hj)] from k = 1 to (N - 1).
     res_A = 1;
     for k = 1:length(hj_eigenvalues)
         res_A = res_A * (ith_eigenvalue - hj_eigenvalues(k));
     end
     
     % 3b. res_B = res_B * [λi(H) - λk(H)]  from k = 1 to N with limitation (k =/= i).
     res_B = 1;
     for k = 1:length(H_eigenvalues)
         if ith_eigenvalue ~= H_eigenvalues(k)
             res_B = res_B * (ith_eigenvalue - H_eigenvalues(k));
         end
     end
     
     % 4. ||v(i,j)||^2 = res_A / res_B.
     v_ij = res_A/res_B;
end
