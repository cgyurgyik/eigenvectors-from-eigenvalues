#include "GetEigenvectorFromEigenvalues.h"
#include <armadillo>

arma::vec GetEigenvectorFromEigenvalues(const arma::mat& H, const arma::vec& ii, int j) {
    if (!H.is_square()) {
        throw std::invalid_argument("\nH is not square.");
    }
    for (const double i : ii) {
        if (i < 1 || i > H.n_rows) {
            throw std::invalid_argument("\nEach i in ii must be a row of the matrix H. "
                                        "For each i, 1 <= i <= N.");
        }
    }
    if (j < 1 || j > H.n_cols) {
        throw std::invalid_argument("\nj must be an integer representing the "
                                    "column of the desired eigenvector values, "
                                    "such that 1 <= j <= N.");
    }

    // 1.  Produce eigenvalues of H.
    const arma::vec H_eigenvalues = eig_sym(H);

    // 2a. Remove jth row and column
    arma::mat Hj = H;
    Hj.shed_col(j - 1);
    Hj.shed_row(j - 1);

    // 2b. Produce eigenvalues of Hj.
    const arma::vec Hj_eigenvalues = eig_sym(Hj);

    const int num_i = ii.n_elem;
    arma::vec v_j(num_i, arma::fill::zeros);

    for (int m = 0; m < num_i; ++m) {
        const int index = ii[m] - 1;
        const double lambda_H_i = H_eigenvalues[index];

        v_j[m] = 1;
        for (int k = 0; k < H_eigenvalues.size() && (index != k); ++k) {
            const double lambda_H_k = H_eigenvalues[k];
            const double lambda_Hj_k = Hj_eigenvalues[k];
            v_j[m] *= (lambda_H_i - lambda_Hj_k ) / (lambda_H_i - lambda_H_k);
        }
    }
    return v_j;
}
