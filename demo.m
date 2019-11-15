
% Demonstration:
H = [ -1  4  -2  ; ...
      -3  4   0  ; ...
      -3  1   3  ];

[~, ~, eigenvectors] = eig(H);
disp('Eigenvectors using MatLab function: eig(H):')
disp(eigenvectors);

v11 = getEigenvectorFromEigenvalues(H,1,1);
v12 = getEigenvectorFromEigenvalues(H,1,2);
v13 = getEigenvectorFromEigenvalues(H,1,3);

v21 = getEigenvectorFromEigenvalues(H,2,1);
v22 = getEigenvectorFromEigenvalues(H,2,2);
v23 = getEigenvectorFromEigenvalues(H,2,3);

v31 = getEigenvectorFromEigenvalues(H,3,1);
v32 = getEigenvectorFromEigenvalues(H,3,2);
v33 = getEigenvectorFromEigenvalues(H,3,3);
ev_of_H = [v11 v21 v31; ...
           v12 v22 v32; ...
           v13 v23 v33];

disp('Eigenvectors using getEigenvectorFromEigenvalues(H,i,j):')
disp(ev_of_H);
