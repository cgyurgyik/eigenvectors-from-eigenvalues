% Demonstration of the GEFE functions.

n = 5;
H = randn(n,n);
H = (H+H')/2;

[eigenvectors, ~] = eig(H);
disp('Eigenvectors using MatLab function: eig(H):')
disp(eigenvectors);

ev_of_H = GetAllEigenvectorsFromEigenvalues(H);

disp('Eigenvectors using getEigenvectorFromEigenvalues(H,i,j):')
disp(ev_of_H);

disp('Tolerance for a small Hermitian matrix:')
disp(eigenvectors.^2 - ev_of_H');
