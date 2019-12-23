#include "GetEigenvectorFromEigenvalues.h"
#include <armadillo>

arma::vec GetEigenvectorFromEigenvalues(const arma::mat& H, int i, int j) {
    if (!H.is_square()) {
        throw std::invalid_argument("\nH is not square.");
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

    const int index = i - 1;
    const double lambda_H_i = H_eigenvalues[index];

    arma::vec v_j(1, arma::fill::ones);

    // Top
    for (int k = 0; k < H_eigenvalues.size(); ++k) {
        const double lambda_Hj_k = Hj_eigenvalues[k];
        v_j[index] *= (lambda_H_i - lambda_Hj_k);
        
        const double lambda_H_k = H_eigenvalues[k];
        if (lambda_H_k != lambda_H_i) {
            v_j[index] *= 1 / (lambda_H_i - lambda_H_k);
        }
    }
    return v_j;
}

arma::vec remove_kth_element(arma::vec old_vector, int k) {
    arma::vec new_vector(old_vector.size() - 1);
    int pos;
    for (int i = 0; i < new_vector.size(); ++i, ++pos) {
        if (i == k) {
            pos++;
            continue;
        }
        new_vector[i] = old_vector[pos];
    }
    return new_vector;
}

arma::vec DebugGetEigenvectorFromEigenvalues(const arma::mat& H, const arma::vec& ii, int j) {
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
    arma::vec v_j(num_i, arma::fill::ones);

    for (int m = 0; m < num_i; ++m) {
        const int index = ii[m] - 1;
        const double lambda_H_i = H_eigenvalues[index];
        printf("\nm: %d\n", m);
        for (int k = 0; k < H_eigenvalues.size(); ++k) {
            printf("\nk:%d\n", k);
            const double lambda_H_k = H_eigenvalues[k];
            const double lambda_Hj_k = Hj_eigenvalues[k];
            if (k == index) {
                v_j[m] *= (lambda_H_i - lambda_Hj_k);
                continue;
            }
            printf("\nk: %d\n", k);
            printf("lambda_H_i - lambda_Hj_k: %f \nlambda_H_i - lambda_H_k: %f \n",
                   lambda_H_i - lambda_Hj_k, lambda_H_i - lambda_H_k);

            v_j[m] *= (lambda_H_i - lambda_Hj_k ) / (lambda_H_i - lambda_H_k);
            printf("\nv_j[%d]: %f\n", m, v_j[m]);
        }
        printf("\nv_j[0]: %f\n", v_j[0]);
        printf("\nv_j[1]: %f\n", v_j[1]);
    }
    return v_j;
}
