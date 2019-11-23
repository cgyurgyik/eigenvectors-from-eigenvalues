# EigenvectorsFromEigenvalues
Implementing the formula necessary to compute normed eigenvectors given only eigenvalues.

<a href="https://www.codecogs.com/eqnedit.php?latex=\newline&space;\left&space;|&space;v_{i,j}&space;\right&space;|^{2}&space;=&space;\dfrac{\prod_{k=1}^{n-1}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(h_{j}))}&space;{&space;\prod_{1&space;\leq&space;k&space;\leq&space;n}^{i&space;\neq&space;k}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(H))}&space;\newline\newline\newline&space;{h_{j}}:&space;(n-1)\times(n-1)&space;\texttt{&space;matrix&space;with&space;jth&space;row&space;and&space;jth&space;column&space;removed.}&space;\newline&space;\lambda(H):&space;\texttt{&space;eigenvalues&space;of&space;}&space;H.&space;\newline&space;\lambda(h_{j}):&space;\texttt{&space;eigenvalues&space;of&space;}&space;h_{j}." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\newline&space;\left&space;|&space;v_{i,j}&space;\right&space;|^{2}&space;=&space;\dfrac{\prod_{k=1}^{n-1}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(h_{j}))}&space;{&space;\prod_{1&space;\leq&space;k&space;\leq&space;n}^{i&space;\neq&space;k}&space;(\lambda_{i}(H)&space;-&space;\lambda_{k}(H))}&space;\newline\newline\newline&space;{h_{j}}:&space;(n-1)\times(n-1)&space;\texttt{&space;matrix&space;with&space;jth&space;row&space;and&space;jth&space;column&space;removed.}&space;\newline&space;\lambda(H):&space;\texttt{&space;eigenvalues&space;of&space;}&space;H.&space;\newline&space;\lambda(h_{j}):&space;\texttt{&space;eigenvalues&space;of&space;}&space;h_{j}." title="\newline \left | v_{i,j} \right |^{2} = \dfrac{\prod_{k=1}^{n-1} (\lambda_{i}(H) - \lambda_{k}(h_{j}))} { \prod_{1 \leq k \leq n}^{i \neq k} (\lambda_{i}(H) - \lambda_{k}(H))} \newline\newline\newline {h_{j}}: (n-1)\times(n-1) \texttt{ matrix with jth row and jth column removed.} \newline \lambda(H): \texttt{ eigenvalues of } H. \newline \lambda(h_{j}): \texttt{ eigenvalues of } h_{j}." /></a>

- See [Eigenvectors From Eigenvalues](https://arxiv.org/pdf/1908.03795.pdf) for proof. 

## Objectives
Since this formula can produce a specific normed eigenvector value of the ith row and jth column, **"This may be useful when dealing with large matrices and only a few eigenvector values are needed."** (Professor A. Townsend, Cornell University). I intend to compare this with current industry standards, starting with MATLAB and then exploring other languages where matrices are fundamental.

Basic criteria include time and (eventually) space complexity, while also meeting precision requirements.

## TODOs
- Compare times for using sort() (to improve precision) versus not using sort(). If it greatly differs, think about adding an argument to allow for either better time or better precision.
- Determine when the overhead cost of parallelized for loops still results in reduction of time.

## Initial Results
- These trials were conducted with 10 runs averaged per matrix size N. A technique introduced to minimize underflow is to divide numbers that are relatively close to each other in size. The goal is to get each division as close as possible to 1. This requires sorting the results of the product using MATLAB's sort(). While our precision did improve, it was at the cost of speed, since it requires sorting N elements twice. Still, it was quicker to find a random N eigenvector using GEFE when N is large. To minimize this cost, MATLAB's parallel for loops were initiated when N was large.

![Average Time to Retrieve the Nth Eigenvector](trials/results/ImprovedPrecisionParallelAverageTime.png)

- The absolute tolerance was measured by taking the average absolute tolerance of each value (compared with eig) in the given random eigenvector.

![Average Absolute Tolerance](trials/results/WithSortAveragePrecision.png)

## Complexity
<a href="https://www.codecogs.com/eqnedit.php?latex=\text{GEFE&space;Approximate&space;Time&space;Complexity&space;for&space;an&space;N&space;x&space;N&space;matrix:}&space;\newline&space;\newline&space;\text{&space;}&space;\forall&space;\text{&space;}&space;i,&space;j&space;\text{&space;to&space;compute&space;}&space;|v_{i,j}|^2&space;\text{&space;:&space;}&space;\newline&space;\newline&space;\text{&space;Let&space;E&space;=&space;cost&space;of&space;eig(H)&space;}&space;\approx&space;O(N^3)&space;\newline&space;\text{&space;Let&space;Ej&space;=&space;cost&space;of&space;eig(Hj)&space;}&space;\approx&space;O((N-1)^3)&space;\newline&space;\text{&space;Let&space;S&space;=&space;cost&space;of&space;MATLAB&space;sort()&space;}&space;\approx&space;O((N-1)log(N-1))&space;\newline&space;\text{&space;Let&space;P&space;=&space;cost&space;of&space;MATLAB&space;prod()&space;}&space;\approx&space;O((N&space;-&space;1)&space;-&space;1)&space;\approx&space;O(N-2)&space;\newline&space;\text{&space;Let&space;D&space;=&space;cost&space;of&space;MATLAB&space;rdivide()&space;}&space;\approx&space;O(N-1)&space;\newline&space;\newline&space;\text{Then,}&space;\newline&space;O(E&space;&plus;&space;Ej&space;&plus;&space;2S&space;&plus;&space;P&space;&plus;&space;D)&space;\newline&space;\approx&space;O(N^3&space;&plus;&space;(N-1)^3&space;&plus;&space;2(N-1)log(N-1)&space;&plus;&space;(N-2)&space;&plus;&space;(N-1))&space;\newline&space;\approx&space;O(2N^3&space;&plus;&space;3N^2&space;&plus;&space;2Nlog(N-1)&space;&plus;&space;5N&space;-&space;2log(N-1))&space;\newline&space;\newline" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\text{GEFE&space;Approximate&space;Time&space;Complexity&space;for&space;an&space;N&space;x&space;N&space;matrix:}&space;\newline&space;\newline&space;\text{&space;}&space;\forall&space;\text{&space;}&space;i,&space;j&space;\text{&space;to&space;compute&space;}&space;|v_{i,j}|^2&space;\text{&space;:&space;}&space;\newline&space;\newline&space;\text{&space;Let&space;E&space;=&space;cost&space;of&space;eig(H)&space;}&space;\approx&space;O(N^3)&space;\newline&space;\text{&space;Let&space;Ej&space;=&space;cost&space;of&space;eig(Hj)&space;}&space;\approx&space;O((N-1)^3)&space;\newline&space;\text{&space;Let&space;S&space;=&space;cost&space;of&space;MATLAB&space;sort()&space;}&space;\approx&space;O((N-1)log(N-1))&space;\newline&space;\text{&space;Let&space;P&space;=&space;cost&space;of&space;MATLAB&space;prod()&space;}&space;\approx&space;O((N&space;-&space;1)&space;-&space;1)&space;\approx&space;O(N-2)&space;\newline&space;\text{&space;Let&space;D&space;=&space;cost&space;of&space;MATLAB&space;rdivide()&space;}&space;\approx&space;O(N-1)&space;\newline&space;\newline&space;\text{Then,}&space;\newline&space;O(E&space;&plus;&space;Ej&space;&plus;&space;2S&space;&plus;&space;P&space;&plus;&space;D)&space;\newline&space;\approx&space;O(N^3&space;&plus;&space;(N-1)^3&space;&plus;&space;2(N-1)log(N-1)&space;&plus;&space;(N-2)&space;&plus;&space;(N-1))&space;\newline&space;\approx&space;O(2N^3&space;&plus;&space;3N^2&space;&plus;&space;2Nlog(N-1)&space;&plus;&space;5N&space;-&space;2log(N-1))&space;\newline&space;\newline" title="\text{GEFE Approximate Time Complexity for an N x N matrix:} \newline \newline \text{ } \forall \text{ } i, j \text{ to compute } |v_{i,j}|^2 \text{ : } \newline \newline \text{ Let E = cost of eig(H) } \approx O(N^3) \newline \text{ Let Ej = cost of eig(Hj) } \approx O((N-1)^3) \newline \text{ Let S = cost of MATLAB sort() } \approx O((N-1)log(N-1)) \newline \text{ Let P = cost of MATLAB prod() } \approx O((N - 1) - 1) \approx O(N-2) \newline \text{ Let D = cost of MATLAB rdivide() } \approx O(N-1) \newline \newline \text{Then,} \newline O(E + Ej + 2S + P + D) \newline \approx O(N^3 + (N-1)^3 + 2(N-1)log(N-1) + (N-2) + (N-1)) \newline \approx O(2N^3 + 3N^2 + 2Nlog(N-1) + 5N - 2log(N-1)) \newline \newline" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=\newline&space;\newline&space;\text{We&space;can&space;then&space;scale&space;for&space;the&space;entire&space;eigenvector&space;}&space;|v_{i,j}|^2,&space;\text{where&space;}&space;1&space;\leq&space;j&space;\leq&space;N.&space;\newline&space;\text{Since&space;E&space;and&space;Ej&space;are&space;computed&space;once,&space;we&space;need&space;only&space;to&space;multiply&space;the&space;rest&space;by&space;a&space;factor&space;of&space;N.}&space;\newline&space;\newline&space;O(E&space;&plus;&space;Ej&space;&plus;&space;(2N)S&space;&plus;&space;(N)P&space;&plus;&space;(N)D)&space;\newline&space;\approx&space;O(N^3&space;&plus;&space;(N-1)^3&space;&plus;&space;2N(N-1)log(N-1)&space;&plus;&space;N(N-2)&space;&plus;&space;N(N-1))&space;\newline&space;\approx&space;O(2N^3&space;&plus;&space;2N^2log(N-1)&space;&plus;&space;3N^2&space;&plus;&space;N^2&space;&plus;&space;N^2&space;-&space;2Nlog(N-1)&space;-&space;2N&space;&plus;&space;3N&space;-&space;N&space;\newline&space;\approx&space;O(2N^3&space;&plus;&space;2N^2log(N-1)&space;&plus;&space;5N^2&space;-&space;2Nlog(N-1))" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\newline&space;\newline&space;\text{We&space;can&space;then&space;scale&space;for&space;the&space;entire&space;eigenvector&space;}&space;|v_{i,j}|^2,&space;\text{where&space;}&space;1&space;\leq&space;j&space;\leq&space;N.&space;\newline&space;\text{Since&space;E&space;and&space;Ej&space;are&space;computed&space;once,&space;we&space;need&space;only&space;to&space;multiply&space;the&space;rest&space;by&space;a&space;factor&space;of&space;N.}&space;\newline&space;\newline&space;O(E&space;&plus;&space;Ej&space;&plus;&space;(2N)S&space;&plus;&space;(N)P&space;&plus;&space;(N)D)&space;\newline&space;\approx&space;O(N^3&space;&plus;&space;(N-1)^3&space;&plus;&space;2N(N-1)log(N-1)&space;&plus;&space;N(N-2)&space;&plus;&space;N(N-1))&space;\newline&space;\approx&space;O(2N^3&space;&plus;&space;2N^2log(N-1)&space;&plus;&space;3N^2&space;&plus;&space;N^2&space;&plus;&space;N^2&space;-&space;2Nlog(N-1)&space;-&space;2N&space;&plus;&space;3N&space;-&space;N&space;\newline&space;\approx&space;O(2N^3&space;&plus;&space;2N^2log(N-1)&space;&plus;&space;5N^2&space;-&space;2Nlog(N-1))" title="\newline \newline \text{We can then scale for the entire eigenvector } |v_{i,j}|^2, \text{where } 1 \leq j \leq N. \newline \text{Since E and Ej are computed once, we need only to multiply the rest by a factor of N.} \newline \newline O(E + Ej + (2N)S + (N)P + (N)D) \newline \approx O(N^3 + (N-1)^3 + 2N(N-1)log(N-1) + N(N-2) + N(N-1)) \newline \approx O(2N^3 + 2N^2log(N-1) + 3N^2 + N^2 + N^2 - 2Nlog(N-1) - 2N + 3N - N \newline \approx O(2N^3 + 2N^2log(N-1) + 5N^2 - 2Nlog(N-1))" /></a>
- Note that these complexities will be improved upon with MATLAB's parallel for loops. Since each eigenvector value does not depend on the last one, the product and sort can be parallelized.
