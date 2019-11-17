function v_j = GetEigenvectorFromEigenvalues(varargin)
% GetEigenvectorFromEigenvalues(H, ii, j, H_eigenvalues) calculates eigenvectors from the eigenvalues of the matrix.
% Designed to cater to the power user, allowing him or her to produce eigenvalues in the most efficient manner.
%
% Reference: https://arxiv.org/pdf/1908.03795.pdf
%
% Gets the normed eigenvector ||v(i,j)||^2 for each i in 'ii' from the matrix H.
%   Takes in 3 or 4 arguments:
%   - 'H' must be a N x N Hermitian matrix.
%   - 'ii' is the row(s) of column 'j'.    for each i, 1 <= i <= N.
%   - 'j' is the column.                               1 <= j <= N.
%   - (optional) 'H_eigenvalues' are the eigenvalues of H. If not provided,
%     defaults to using MATLAB's eig().
% Currently, the eigenvalues of hj are produced using MATLAB's eig().
%
% Requires: length(H_eigenvalues) == N.

     if nargin < 3 || nargin > 4
         error('GetEigenvectorFromEigenvalues accepts 3 or 4 arguments: H, ii, j, (optional) H_eigenvalues.');
     end
     
     H = varargin{1};
     [M,N] = size(H);
     if ~ismatrix(H) || M ~= N
         error('H must be a N x N matrix.');
     end
     
     ii = varargin{2};
     if ~isvector(ii)
         error('ii must be a vector containing the rows of column j for which you want the eigenvector values.')
     end
     
     j = varargin{3};
     if ~isvector(j) || length(j) ~= 1
         error('j must be an integer representing the column of the desired eigenvector values, such that 1 <= j <= N.')
     end
    
     if nargin == 3
         % Calculate the eigenvalues of λi(H).
         H_eigenvalues = eig(H);
     else
         % Eigenvalues provided by the client.
         H_eigenvalues = varargin{4};
     end
     
     assert(length(H_eigenvalues) == N, 'Number of eigenvalues must be equivalent to the number of rows and columns in the matrix.');
    
     H(:, j) = []; % Remove jth column.
     H(j, :) = []; % Remove jth row.
     Hj_eigenvalues = eig(H);
     
     num_i = numel(ii);
     v_j = zeros(num_i,1);
     
     for k = 1:num_i
         ei = H_eigenvalues(ii(k));
         H_ii = H_eigenvalues;
         H_ii(ii(k)) = [];
         
         v_j(k) = prod( (ei - Hj_eigenvalues) ./ (ei - H_ii) );
     end
end
