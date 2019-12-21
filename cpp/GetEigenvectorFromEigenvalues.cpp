#include "GetEigenvectorFromEigenvalues.hpp"
#include <armadillo>

arma::cx_vec GetEigenvectorFromEigenvalues(arma::mat H, arma::vec ii, int j) {
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
    const arma::cx_vec H_eigenvalues = eig_gen(H);

    // 2a. Remove jth row and column
    arma::mat Hj = H;
    Hj.shed_col(j);
    Hj.shed_row(j);

    // 2b. Produce eigenvalues of Hj.
    const arma::cx_vec Hj_eigenvalues = eig_gen(Hj);

    const int num_i = ii.size();
    arma::cx_vec v_j(num_i, arma::fill::zeros);

    // 3.  Perform algorithm.
    for (int m = 0; m < num_i; ++m) {
        const int i = ii[m];
        const std::complex<double> lambda_H_i = H_eigenvalues[i];

        v_j[m] = 1;
        for (int k = 0; k < H_eigenvalues.size() && (i != k); ++k) {
            const std::complex<double> lambda_H_k = H_eigenvalues[k];
            const std::complex<double> lambda_Hj_k = Hj_eigenvalues[k];
            v_j[m] *= (lambda_H_i - lambda_Hj_k ) / (lambda_H_i - lambda_H_k);
        }
    }
    return v_j;
}
