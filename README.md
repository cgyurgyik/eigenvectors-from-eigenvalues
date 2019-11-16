# EigenvectorsFromEigenvalues
Implementing the formula necessary to compute eigenvectors given only eigenvalues.

<a href="https://www.codecogs.com/eqnedit.php?latex=\newline&space;\sum_{j=1}^{n}&space;\left&space;|&space;v_{n,j}&space;\right&space;|^{2}&space;=&space;\dfrac{\sum_{k=1}^{n-1}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(h_{j}))}&space;{&space;\prod_{1&space;\leq&space;k&space;\leq&space;n}^{i&space;\neq&space;k}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(H))}&space;\newline&space;\lambda_{i}(H):&space;\texttt{&space;eigenvalues&space;of&space;}&space;H.&space;\newline&space;{h_{j}}:&space;(n-1)\times(n-1)&space;\texttt{&space;matrix&space;with&space;jth&space;row&space;and&space;jth&space;column&space;removed.}&space;\newline&space;\lambda_{i}(h_{j}):&space;\texttt{&space;eigenvalues&space;of&space;}&space;h_{j}." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\newline&space;\sum_{j=1}^{n}&space;\left&space;|&space;v_{n,j}&space;\right&space;|^{2}&space;=&space;\dfrac{\sum_{k=1}^{n-1}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(h_{j}))}&space;{&space;\prod_{1&space;\leq&space;k&space;\leq&space;n}^{i&space;\neq&space;k}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(H))}&space;\newline&space;\lambda_{i}(H):&space;\texttt{&space;eigenvalues&space;of&space;}&space;H.&space;\newline&space;{h_{j}}:&space;(n-1)\times(n-1)&space;\texttt{&space;matrix&space;with&space;jth&space;row&space;and&space;jth&space;column&space;removed.}&space;\newline&space;\lambda_{i}(h_{j}):&space;\texttt{&space;eigenvalues&space;of&space;}&space;h_{j}." title="\newline \sum_{j=1}^{n} \left | v_{n,j} \right |^{2} = \dfrac{\sum_{k=1}^{n-1} (\lambda_{i}(H) - \lambda_{k}(h_{j}))} { \prod_{1 \leq k \leq n}^{i \neq k} (\lambda_{i}(H) - \lambda_{k}(H))} \newline \lambda_{i}(H): \texttt{ eigenvalues of } H. \newline {h_{j}}: (n-1)\times(n-1) \texttt{ matrix with jth row and jth column removed.} \newline \lambda_{i}(h_{j}): \texttt{ eigenvalues of } h_{j}." /></a>

See: https://arxiv.org/pdf/1908.03795.pdf for proof.

## Objective(s)
Since this formula can produce a specific eigenvector of the ith row and jth column, "this may be useful when dealing with large matrices and only a few eigenvectors are needed." (Professor A. Townsend, Cornell University). I would like to compare this with current industry standards, starting with Matlab and then exploring other languages where matrices are fundamental.

Basic criteria include both time and (eventually) space complexity, while meeting accuracy requirements.

## TODO(s) 
- Improve the current implementation.
- Add more tests.
- Since we only need to compute the eigenvalues, research fastest way to compute eigenvalues on Matlab.
- Read: https://www.mathworks.com/matlabcentral/fileexchange/48-locally-optimal-block-preconditioned-conjugate-gradient
- Compare speeds to eig() on variety of matrices (large, sparse, circulant, ...)
