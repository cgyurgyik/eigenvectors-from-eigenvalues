#include <armadillo>
#include "GetEigenvectorFromEigenvalues.h"

// Demonstration.
int main() {
    const arma::mat H("-0.2414 0.3160; 0.3160 -0.8649");
    const arma::vec eigvec = GetEigenvectorFromEigenvalues(H, /*row i=*/2, /*column j=*/1);

    printf("\nGEFE:\n");
    eigvec.print();
    arma::vec arma_eigvals;
    arma::mat arma_eigvecs;
    arma::eig_sym(arma_eigvals, arma_eigvecs, H);

    printf("\narma::eig_sym:\n");
    arma_eigvecs = arma::square(arma_eigvecs);
    arma_eigvecs.col(0).print();
}

