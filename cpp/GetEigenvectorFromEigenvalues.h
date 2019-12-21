#ifndef GEFE_GETEIGENVECTORFROMEIGENVALUES_H
#define GEFE_GETEIGENVECTORFROMEIGENVALUES_H

#include <armadillo>

// GetEigenvectorFromEigenvalues(arma::mat H, arma::vec ii, int j) calculates eigenvectors from the
// eigenvalues of the matrix using the Armadillo C++ Linear Algebra library.
//
// Reference: https://arxiv.org/pdf/1908.03795.pdf
//
// Gets the normed eigenvector ||v(i,j)||^2 for each i in 'ii' from the matrix H.
//   Takes in 3 or 4 arguments:
//   - 'H' must be a N x N Hermitian matrix.
//   - 'ii' is the row(s) of column 'j'.    for each i, 1 <= i <= N.
//   - 'j' is the column.                               1 <= j <= N.
//
// Currently, the eigenvalues are produced using Armadillo's eig_sym().
//
// Example 1:
//          arma::mat H("1 1 ; 0 0");
//          arma::vec ii("1 2");
//          arma::vec eigvals = GetEigenvectorFromEigenvalues(H, ii, /*column j=*/1);
//
//          eigvals.print(); // 1.000
//                              0.000
// Example 2:
//          arma::mat H("1 1 ; 0 0");
//          arma::vec ii("2 1");
//          arma::vec eigvals = GetEigenvectorFromEigenvalues(H, ii, /*column j=*/1);
//
//          eigvals.print(); // 0.0000
//                              1.0000
arma::cx_vec GetEigenvectorFromEigenvalues(arma::mat H, arma::vec ii, int j);

#endif //GEFE_GETEIGENVECTORFROMEIGENVALUES_H