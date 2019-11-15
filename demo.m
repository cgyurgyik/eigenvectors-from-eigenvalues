
% Demonstration: A must be Hermitian. s
n = 3; 
H = randn(n,n); 
H = (H+H')/2; 

[eigenvectors, D] = eig(H);
disp('Eigenvectors using MatLab function: eig(H):')
disp(eigenvectors);

ev_of_H = zeros(n,n); 
for i = 1:n
    for j = 1:n
        ev_of_H(i,j) = GetEigenvectorFromEigenvalues(H,i,j);
    end
end

disp('Eigenvectors using getEigenvectorFromEigenvalues(H,i,j):')
disp(ev_of_H);

eigenvectors.^2 - ev_of_H'