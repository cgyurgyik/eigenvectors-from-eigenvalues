#include "../GEFE_utility.h"
#include <armadillo>
#include "gtest/gtest.h"
#include <string>

// Compares the normalized eigenvector values produced by GEFE with those
// produced by Armadillo's eig_sym().
void compareGEFEwithARMA(const arma::mat& H) {
    assert(H.is_square());
    std::string column_numbers;
    int numbers[H.n_rows];
    std::iota(numbers, numbers + H.n_rows,0);
    for (auto number : numbers) {
        column_numbers += std::to_string(number);
        column_numbers += " ";
    }
    const arma::vec ii(column_numbers);

    arma::vec arma_eigvals;
    arma::mat arma_eigvecs;
    arma::eig_sym(arma_eigvals, arma_eigvecs, H);

    for (int current_column = 0; current_column < H.n_cols; ++current_column) {
        const arma::vec gefe_eigvecs_column_j = getEigenvectorFromEigenvalues(H, ii, /*j=*/current_column);
        const arma::vec arma_eigvecs_column_j = arma::square(arma_eigvecs.col(current_column)); // Normalized.
        for (const double current_row : gefe_eigvecs_column_j) {
            EXPECT_DOUBLE_EQ(arma_eigvecs_column_j[current_row], gefe_eigvecs_column_j[current_row]);
        }
    }
}

TEST(TwoByTwo, Hermitian) {
    const arma::mat H1("-0.2414 0.3160;"
                       "0.3160 -0.8649");
    compareGEFEwithARMA(H1);

    const arma::mat H2("2.7694 0.8425;"
                       "0.8425 0.7254");
    compareGEFEwithARMA(H2);
}