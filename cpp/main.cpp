#include <armadillo>
#include "GetEigenvectorFromEigenvalues.h"

// Demonstration.
int main() {
    arma::mat H("1 1 ; 0 0");
    arma::vec ii("1 2");
    arma::cx_vec eigvals = GetEigenvectorFromEigenvalues(H, ii, /*column j=*/1);

    eigvals.print(); // "1 0"
}

