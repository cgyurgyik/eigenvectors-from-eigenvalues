#include "GetEigenvectorFromEigenvalues.h"
#include <armadillo>

// Given the corresponding eigenvalues of H and H with the jth column removed, returns the ith
// row eigenvector. This is denoted as:
// prod(lambda_H_i - lambda_Hj_k) / prod(lambda_H_i - lambda_H_k), when i != k.
double GetRowiEigenvector(int i, const arma::mat& H_eigenvalues, const arma::mat& Hj_eigenvalues) {
    const double lambda_H_i = H_eigenvalues[i];
    double v_ij = 1;
    const int jth_column = H_eigenvalues.size() - 1;

    for (int k = 0; k < H_eigenvalues.size(); ++k) {
        double numerator = 1;   // lambda_H_i - lambda_Hj_k
        double denominator = 1; // lambda_H_i - lambda_H_k
        if (k != jth_column) {
            numerator = lambda_H_i - Hj_eigenvalues[k];
        }
        const double lambda_H_k = H_eigenvalues[k];
        if (lambda_H_k != lambda_H_i) {
            denominator = lambda_H_i - lambda_H_k;
        }
        v_ij *= numerator/denominator;
    }
    return v_ij;
}

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

    const arma::vec H_eigenvalues = eig_sym(H);

    arma::mat Hj_eigenvalues = H;
    Hj_eigenvalues.shed_col(j);
    Hj_eigenvalues.shed_row(j);

    return GetRowiEigenvector(i, H_eigenvalues, Hj_eigenvalues);
}

arma::vec GetEigenvectorFromEigenvalues(const arma::mat& H, const arma::vec& ii, int j) {
    if (!H.is_square()) {
        throw std::invalid_argument("\nH is not square.");
    }
    for (const double i : ii) {
        if (i < 0 || i > H.n_rows - 1) {
            throw std::invalid_argument("\nEach i in ii must be a row of the matrix H. "
                                        "For each i, 0 <= i <= N-1.");
        }
    }
    if (j < 0 || j > H.n_cols - 1) {
        throw std::invalid_argument("\nj must be an integer representing the "
                                    "column of the desired eigenvector values, "
                                    "such that 0 <= j <= N-1.");
    }

    const arma::vec H_eigenvalues = eig_sym(H);

    arma::mat Hj_eigenvalues = H;
    Hj_eigenvalues.shed_col(j);
    Hj_eigenvalues.shed_row(j);

    arma::vec v_ij(ii.size(), arma::fill::zeros);
    for (const double i : ii) {
        v_ij[i] = GetRowiEigenvector(i, H_eigenvalues, Hj_eigenvalues);
    }
    return v_ij;
}