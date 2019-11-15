% Iterates through, and produces all the eigenvector values corresponding to
% 'H'. Stores them into 'ev_of_H'.
% Requires: 'H' must be a Hermitian matrix.
function ev_of_H = GetAllEigenvectorsFromEigenvalues(H)
    n = length(H);
    ev_of_H = zeros(n,n);
    for i = 1:n
        for j = 1:n
            ev_of_H(i,j) = GetEigenvectorFromEigenvalues(H,i,j);
        end
    end
end
