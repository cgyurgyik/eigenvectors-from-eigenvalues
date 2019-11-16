% Iterates through, and produces all the eigenvector values corresponding to
% 'H'. Stores them into 'ev_of_H'.
% Requires: 'H' must be a Hermitian matrix.
function ev_of_H = GetAllEigenvectorsFromEigenvalues(H)
    n = length(H);
    ev_of_H = zeros(n,n);
    for j = 1:n
        ev_of_H(:,j) = GetEigenvectorFromEigenvalues(H,1:n,j);
    end
end
