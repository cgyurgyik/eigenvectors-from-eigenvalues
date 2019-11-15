# EigenvectorsFromEigenvalues
[UNDER CONSTRUCTION]

Implementing the formula necessary to compute eigenvectors given only eigenvalues.
See: https://arxiv.org/pdf/1908.03795.pdf for proof.

## Objective(s)
Since this formula can produce a specific eigenvector of the ith row and jth column, "this may be useful when dealing with large matrices and only a few eigenvectors are needed." (Professor A. Townsend, Cornell University). I would like to compare this with current industry standards, starting with Matlab and then exploring other languages where matrices are fundamental.

Basic criteria include both time and (eventually) space complexity.

## TODOs: 
- Improve the current implementation, which is the bare bones version.
- Since we only need to compute the eigenvalues, research fastest way to compute eigenvalues on Matlab.
- Compare speeds to eig() on variety of matrices (large, sparse, circulant, ...)
