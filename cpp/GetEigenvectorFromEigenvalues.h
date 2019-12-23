#ifndef GEFE_GETEIGENVECTORFROMEIGENVALUES_H
#define GEFE_GETEIGENVECTORFROMEIGENVALUES_H

#include <armadillo>

// GetEigenvectorFromEigenvalues(const arma::mat& H, int i, int j)
// calculates eigenvectors from the eigenvalues of the matrix using
// the Armadillo C++ Linear Algebra library.
// Note: It uses indices 0...N-1.
// Reference: https://arxiv.org/pdf/1908.03795.pdf
//
// Gets the normed eigenvector ||v(i,j)||^2 from the matrix H.
//   Takes in 3 or 4 arguments:
//   - 'H' must be a N x N Hermitian matrix.
//   - 'i' is the row.      0 <= i <= N-1.
//   - 'j' is the column.   0 <= j <= N-1.
//
// Currently, the eigenvalues are produced using Armadillo's eig_sym().
//
// Example:
//      const arma::mat H("-0.2414 0.3160; 0.3160 -0.8649");
//      const arma::vec v11 = GetEigenvectorFromEigenvalues(H, 0, 0);
//      printf("\n v(1,1): %f", v11);  // 0.1488
double GetEigenvectorFromEigenvalues(const arma::mat& H, int i, int j);

// GetEigenvectorFromEigenvalues(const arma::mat& H, const arma::vec& ii, int j)
// calculates eigenvectors from the eigenvalues of the matrix using the
// Armadillo C++ Linear Algebra library.
// Note: It uses indices 0...N-1.
// Reference: https://arxiv.org/pdf/1908.03795.pdf
//
// Gets the normed eigenvector ||v(i,j)||^2 for each i in 'ii' from the matrix H.
//   Takes in 3 or 4 arguments:
//   - 'H' must be a N x N Hermitian matrix.
//   - 'ii' is the row(s) of column 'j'.    for each i, 0 <= i <= N-1.
//   - 'j' is the column.                               0 <= j <= N-1.
//
// Currently, the eigenvalues are produced using Armadillo's eig_sym().
//
// Example :
//          const arma::mat H("-0.2414 0.3160; 0.3160 -0.8649");
//          arma::vec ii("0 1");
//          arma::vec eigvecs = GetEigenvectorFromEigenvalues(H, ii, /*column j=*/0);
//          eigvecs.print(); //    0.1488
//                           //    0.8512
arma::vec GetEigenvectorFromEigenvalues(const arma::mat& H, const arma::vec& ii, int j);

#endif //GEFE_GETEIGENVECTORFROMEIGENVALUES_H