% Tests for GEFE function family.
%
% To run tests: results = runtests('GetEigenvectorFromEigenvaluesTest');
%
% Notes: Relative tolerance increases as the matrix size
% increases. Likely due to rounding errors.

function tests = GetEigenvectorFromEigenvaluesTest
    tests = functiontests(localfunctions);
end

function testSmallHermitianMatrix(testCase)
    H = randn(10,10);
    Small_Hermitian_Matrix = (H+H')/2;
    actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Small_Hermitian_Matrix);
    [expected_eigenvectors, ~] = eig(Small_Hermitian_Matrix);
    
    verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
end

function testMediumHermitianMatrix(testCase)
    H = randn(25,25);
    Med_Hermitian_Matrix = (H+H')/2;
    actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Med_Hermitian_Matrix);
    [expected_eigenvectors, ~] = eig(Med_Hermitian_Matrix);
    
    verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
end

function testMediumHermitianMatrix2(testCase)
    H = randn(100,100);
    Med_Hermitian_Matrix = (H+H')/2;
    actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Med_Hermitian_Matrix);
    [expected_eigenvectors, ~] = eig(Med_Hermitian_Matrix);
    
    verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
end

% function testLargeHermitianMatrix(testCase)
%     H = randn(250,250);
%     Lg_Hermitian_Matrix = (H+H')/2;
%     actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Lg_Hermitian_Matrix);
%     [expected_eigenvectors, ~] = eig(Lg_Hermitian_Matrix);
%
%     verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
% end

function testSmallTridiagonalMatrix(testCase)
    N = 10;
    H = full(gallery('tridiag',N,-1,2,-1));
    Small_Tridiagonal_Matrix = (H+H')/2;
    actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Small_Tridiagonal_Matrix);
    [expected_eigenvectors, ~] = eig(Small_Tridiagonal_Matrix);
    
    verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
end

function testMediumTridiagonalMatrix(testCase)
    N = 100;
    H = full(gallery('tridiag',N,-1,3,-1));
    Medium_Tridiagonal_Matrix = (H+H')/2;
    actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Medium_Tridiagonal_Matrix);
    [expected_eigenvectors, ~] = eig(Medium_Tridiagonal_Matrix);
    
    verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
end

function testLargeTridiagonalMatrix(testCase)
    N = 250;
    H = full(gallery('tridiag',N,-1,4,-1));
    Large_Tridiagonal_Matrix = (H+H')/2;
    actual_eigenvectors = GetAllEigenvectorsFromEigenvalues(Large_Tridiagonal_Matrix);
    [expected_eigenvectors, ~] = eig(Large_Tridiagonal_Matrix);
    
    verifyEqual(testCase, actual_eigenvectors', expected_eigenvectors.^2, 'RelTol', 1.0e-5);
end
