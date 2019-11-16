% Iterates through, and produces all the eigenvector values corresponding to
% 'H'. Stores them into 'ev_of_H'.
%   Takes in 1 or 2 arguments:
%   - 'H' must be a Hermitian matrix.
%   - (optional) 'H_eigenvalues' are the eigenvalues of H. If not provided,
%     defaults to using MATLAB's eig().
function ev_of_H = GetAllEigenvectorsFromEigenvalues(varargin)
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
    for j = 1:n
        ev_of_H(:,j) = GetEigenvectorFromEigenvalues(H,1:n,j, H_eigenvalues);
    end
end
