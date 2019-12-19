function ev_of_H = GetAllEigenvectorsFromEigenvalues(varargin)
% GetAllEigenvectorsFromEigenvalues(H, H_eigenvalues) iterates through,
% and produces all the eigenvector values corresponding to 'H'. These
% values are then stored in 'ev_of_H'.
%
%   Takes in 1 or 2 arguments:
%   - 'H' must be a Hermitian matrix.
%   - (optional) 'H_eigenvalues' are the eigenvalues of H. If not provided,
%     defaults to using MATLAB's eig().
%
% See: GetEigenvectorFromEigenvalues() for more information.
% Example:
%          A = [1 1;
%               0 0];
%          GetAllEigenvectorsFromEigenvalues(A);
%
%          Returns: [1 0;
%                    0 1]
%
% Also valid:
%          eigvals = eig(H);
%          GetAllEigenvectorsFromEigenvalues(A, eigvals);
%
% NOTE: This is quite a bit slower than just using eig(), and is mostly for demonstration purposes. 
% If you need ALL the eigenvectors, use built-in MATLAB functions.

    H = varargin{1};
    if nargin == 1
        H_eigenvalues = eig(H);
    elseif nargin == 2
        H_eigenvalues = varargin{2};
    else
         error('GetAllEigenvectorFromEigenvalues accepts 1 or 2 arguments.')
    end
    
    n = length(H);
    ev_of_H = zeros(n,n);
    parfor j = 1:n
        ev_of_H(:,j) = GetEigenvectorFromEigenvalues(H,1:n,j, H_eigenvalues);
    end
end
