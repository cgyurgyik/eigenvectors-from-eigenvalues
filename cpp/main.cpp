#include <armadillo>
#include "GetEigenvectorFromEigenvalues.h"

// Demonstration.
int main() {
    // TODO: Function in the works still.
    const arma::mat H("-0.2414 0.3160; 0.3160 -0.8649");
    const arma::vec ii("1 2");
    const arma::vec eigvals = GetEigenvectorFromEigenvalues(H, ii, /*column j=*/1);

    eigvals.print(); // "0.1489
                     //  0.8512"
}

