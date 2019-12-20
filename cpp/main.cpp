#include <armadillo>
#include "GetEigenvectorFromEigenvalues.hpp"

// Demonstration.
int main() {
    arma::mat H("1 1 ; 0 0");
    arma::vec ii("2 1");
    arma::vec eigvals = GetEigenvectorFromEigenvalues(H, ii, /*column j=*/1);

    eigvals.print(); // "0 1"
}

