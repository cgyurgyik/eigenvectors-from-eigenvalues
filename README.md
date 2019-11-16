# EigenvectorsFromEigenvalues
Implementing the formula necessary to compute eigenvectors given only eigenvalues.

<a href="https://www.codecogs.com/eqnedit.php?latex=\newline&space;(1)\sum_{j=1}^{n}&space;\left&space;|&space;v_{n,j}&space;\right&space;|^{2}&space;\prod_{k=1}^{n-1}&space;\lambda_{k}(A)&space;=&space;\sum_{j=1}^{n}det(M_{j})&space;\newline&space;(2)\sum_{j=1}^{n}&space;\left&space;|&space;v_{n,j}&space;\right&space;|^{2}&space;=&space;\dfrac{\sum_{j=1}^{n}det(M_{j})}&space;{&space;\prod_{k=1,&space;k\neq&space;i}^{n-1}&space;\lambda_{k}(A)}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\newline&space;(1)\sum_{j=1}^{n}&space;\left&space;|&space;v_{n,j}&space;\right&space;|^{2}&space;\prod_{k=1}^{n-1}&space;\lambda_{k}(A)&space;=&space;\sum_{j=1}^{n}det(M_{j})&space;\newline&space;(2)\sum_{j=1}^{n}&space;\left&space;|&space;v_{n,j}&space;\right&space;|^{2}&space;=&space;\dfrac{\sum_{j=1}^{n}det(M_{j})}&space;{&space;\prod_{k=1,&space;k\neq&space;i}^{n-1}&space;\lambda_{k}(A)}" title="\newline (1)\sum_{j=1}^{n} \left | v_{n,j} \right |^{2} \prod_{k=1}^{n-1} \lambda_{k}(A) = \sum_{j=1}^{n}det(M_{j}) \newline (2)\sum_{j=1}^{n} \left | v_{n,j} \right |^{2} = \dfrac{\sum_{j=1}^{n}det(M_{j})} { \prod_{k=1, k\neq i}^{n-1} \lambda_{k}(A)}" /></a>

See: https://arxiv.org/pdf/1908.03795.pdf for proof.

## Objective(s)
Since this formula can produce a specific eigenvector of the ith row and jth column, "this may be useful when dealing with large matrices and only a few eigenvectors are needed." (Professor A. Townsend, Cornell University). I would like to compare this with current industry standards, starting with Matlab and then exploring other languages where matrices are fundamental.

Basic criteria include both time and (eventually) space complexity, while meeting accuracy requirements.

## TODO(s) 
- Improve the current implementation.
- Add more tests.
- Since we only need to compute the eigenvalues, research fastest way to compute eigenvalues on Matlab.
- Read: https://www.mathworks.com/matlabcentral/fileexchange/48-locally-optimal-block-preconditioned-conjugate-gradient
- Compare speeds to eig() on variety of matrices (large, sparse, circulant, ...)
