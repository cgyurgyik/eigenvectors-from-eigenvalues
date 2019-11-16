% Calculating eigenvectors from eigenvalues.
% Gets the normed eigenvector ||v(i,j)||^2 for each i in 'ii' from the matrix H.
%   Takes in 3 or 4 arguments:
%   - 'H' must be a Hermitian matrix.
%   - 'ii' is the row(s) of column 'j'.    for each i, 1 <= i <= N.
%   - 'j' is the column.                               1 <= j <= N.
%   - (optional) 'H_eigenvalues' are the eigenvalues of H. If not provided,
%     defaults to using MATLAB's eig().
% Currently, the eigenvalues of hj are produced using MATLAB's eig().
% Requires: 'H_eigenvalues' must have N eigenvalues.
function v_j = GetEigenvectorFromEigenvalues(varargin)
     H = varargin{1};
     ii = varargin{2};
     j = varargin{3};
    
     if nargin == 3
         % Calculate the eigenvalues of λi(H).
         H_eigenvalues = eig(H);
     elseif nargin == 4
         H_eigenvalues = varargin{4};
     else
         error('GetEigenvectorFromEigenvalues accepts 3 or 4 arguments.')
     end
    
     H(:, j) = []; % Remove jth column.
     H(j, :) = []; % Remove jth row.
     Hj_eigenvalues = eig(H);
     
     v_j = zeros(numel(ii),1);
     
     for k = 1:numel(ii)
         ei = H_eigenvalues(ii(k));
         H_ii = H_eigenvalues;
         H_ii(ii(k)) = [];
         
         v_j(k) = prod( (ei - Hj_eigenvalues)./(ei - H_ii) );
     end
end
