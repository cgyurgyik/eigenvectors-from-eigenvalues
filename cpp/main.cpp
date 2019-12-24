#include <armadillo>
#include "GEFE_utility.h"

// Demonstration.
int main() {
    const arma::mat H("-0.2414 0.3160; 0.3160 -0.8649");
    const arma::vec ii("0 1");
    const arma::vec gefe_eigvecs = getEigenvectorFromEigenvalues(H, ii, /*column j=*/0);
    printf("\ngefe:\n");
    gefe_eigvecs.print(); //    0.1488
                          //    0.8512

    arma::vec arma_eigvals;
    arma::mat arma_eigvecs;
    arma::eig_sym(arma_eigvals, arma_eigvecs, H);

    printf("\narma::eig_sym:\n");
    arma_eigvecs = arma::square(arma_eigvecs);
    arma_eigvecs.col(0).print(); //    0.1488
                                         //    0.8512
}

