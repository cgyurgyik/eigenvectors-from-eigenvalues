#ifndef GetEigenvectorFromEigenvalues_hpp
#define GetEigenvectorFromEigenvalues_hpp

#include <stdio.h>
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
arma::vec GetEigenvectorFromEigenvalues(arma::mat H, arma::vec ii, int j) {
    if (!H.is_square()) {
        throw std::invalid_argument("\n"
                                    "H is not square.");
    }
    for (const auto i : ii) {
        if (i < 1 || i > H.n_rows) {
            throw std::invalid_argument("\n"
                                        "Each i in ii must be a row of the matrix H. "
                                        "For each i, 1 <= i <= N.");
        }
    }
    if (j < 1 || j > H.n_cols) {
        throw std::invalid_argument("\n"
                                     "j must be an integer representing the column of "
                                     "the desired eigenvector values, "
                                     "such that 1 <= j <= N.");
    }

    // 1.  Produce eigenvalues of H.
    // 2a. Remove jth row and column
    // 2b. Produce eigenvalues of Hj.
    // 3.  Perform algorithm.

    return arma::vec("0 0");
}


#endif /* GetEigenvectorFromEigenvalues_hpp */
