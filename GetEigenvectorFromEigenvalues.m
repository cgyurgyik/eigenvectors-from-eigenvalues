% Calculating eigenvectors from eigenvalues.
% For more information on proof, see: https://arxiv.org/pdf/1908.03795.pdf

% Gets the normed eigenvector ||v(i,j)||^2 from the matrix H.
% 'H' must be a Hermitian matrix.
% 'i' is the row.    1 <= i <= N.
% 'j' is the column. 1 <= j <= N.
function v_j = GetEigenvectorFromEigenvalues(H, ii, j)
     % 1. Calculate the eigenvalues of λi(H).
     H_eigenvalues = eig(H); 
     
     % 2. Calculate eigenvalues of hj 
     H(:, j) = []; % Remove jth column.
     H(j, :) = []; % Remove jth row.
     Hj_eigenvalues = eig(H);
          
     % 3a. res_A = res_A * [λi(H) - λk(hj)] from k = 1 to (N - 1).
     %res_A = prod( ei - hj_eigenvalues );
     
     % 3b. res_B = res_B * [λi(H) - λk(H)]  from k = 1 to N with limitation (k =/= i).
      
     %res_B = prod( ei - H_eigenvalues );
     
     % 4. |v(i,j)|^2 = res_A / res_B.
     %v_ij = res_A/res_B;
     
     v_j = zeros(numel(ii),1);
     for k = 1:numel(ii)
         ei = H_eigenvalues(ii(k));
         H_ii = H_eigenvalues;
         H_ii(ii(k)) = [];
         
         v_j(k) = prod( (ei - Hj_eigenvalues)./(ei - H_ii) );    
     end
end
