#include "GetEigenvectorFromEigenvalues.h"
#include <armadillo>

double GetEigenvectorFromEigenvalues(const arma::mat& H, int i, int j) {
    if (!H.is_square()) {
        throw std::invalid_argument("\nH is not square.");
    }
    if (i < 0 || i > H.n_rows - 1) {
        throw std::invalid_argument("\nj must be an integer representing the "
                                    "row of the desired eigenvector values, "
                                    "such that 0 <= i <= N-1.");
    }
    if (j < 0 || j > H.n_cols - 1) {
        throw std::invalid_argument("\nj must be an integer representing the "
                                    "column of the desired eigenvector values, "
                                    "such that 0 <= j <= N-1.");
    }

    // 1.  Produce eigenvalues of H.
    const arma::vec H_eigenvalues = eig_sym(H);

    // 2a. Remove jth row and column
    arma::mat Hj = H;
    Hj.shed_col(j);
    Hj.shed_row(j);

    // 2b. Produce eigenvalues of Hj.
    const arma::vec Hj_eigenvalues = eig_sym(Hj);
    const double lambda_H_i = H_eigenvalues[i];
    double v_ij = 1;

    for (int k = 0; k < Hj_eigenvalues.size(); ++k) {
        const double lambda_Hj_k = Hj_eigenvalues[k];
        v_ij *= (lambda_H_i - lambda_Hj_k);
    }

    for (int l = 0; l < H_eigenvalues.size(); ++l) {
        const double lambda_H_k = H_eigenvalues[l];
        if (lambda_H_k == lambda_H_i) continue;
        v_ij *= (1 / (lambda_H_i - lambda_H_k));
    }
    return v_ij;
}