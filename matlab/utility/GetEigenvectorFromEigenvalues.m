function v_j = GetEigenvectorFromEigenvalues(varargin)
% GetEigenvectorFromEigenvalues(H, ii, j, H_eigenvalues) calculates eigenvectors from the eigenvalues of the matrix.
% This is designed to cater to the power user, allowing him or her to provide eigenvalues of H in the most efficient manner.
% If none are provided, this defauts to using MATLAB's eig().
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
% Example 1:
%          A = [1 1;
%               0 0];
%          GetEigenvectorFromEigenvalues(A, [1 2], 1);
%
%          Returns: [1;
%                    0]
%          Similarly,
%          GetEigenvectorFromEigenvalues(A, [2 1], 1);
%
%          Returns: [0;
%                    1]
%
% Example 2:
%          A = [1 1 1;
%               1 2 3;
%               1 1 1];
%          GetEigenvectorFromEigenvalues(A, [1], 1, eig(A)); % Provide your own eigenvalues.
%          Returns: [0.1875]

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
         error('ii must be a vector containing the rows of column j for which you want the eigenvector values.');
     end
     
     greater_than_N = ii > N;
     less_than_one = ii < 1;
     if sum(greater_than_N) ~= 0 || sum(less_than_one) ~= 0
        error('Each i in ii must be a row of the matrix H. For each i, 1 <= i <= N.');
     end
     
     j = varargin{3};
     if ~isvector(j) || length(j) ~= 1 || j > N || j < 1
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
     
     if N >= 2500
        parfor k = 1:num_i
             ei = H_eigenvalues(ii(k));
             H_ii = H_eigenvalues;
             H_ii(ii(k)) = [];
             
             v_j(k) = prod( sort(ei - Hj_eigenvalues) ./ sort(ei - H_ii) );
        end
     else
         for k = 1:num_i
             ei = H_eigenvalues(ii(k));
             H_ii = H_eigenvalues;
             H_ii(ii(k)) = [];

             v_j(k) = prod( sort(ei - Hj_eigenvalues) ./ sort(ei - H_ii) );
        end
     end
end
