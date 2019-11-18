% x_axis = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, ...
%     200, 300, 400, 500, 600, 700, 800, 900, 1000,  ...
%     1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000];

x_axis = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1500, 2000, 2500, 3000];

num_trials = 10;

title1 = 'GEFE Avg Relative Tolerance Across Matrix vs. N x N Matrix';
title2 = 'GEFE Avg Absolute Tolerance Across Matrix vs. N x N Matrix';
x_label = 'N';
y_label = 'Tolerance';
saveas_name1 = 'AverageRelTolerances';
saveas_name2 = 'AverageAbsTolerances';

rel_tol = zeros(1, length(x_axis));
abs_tol = zeros(1, length(x_axis));


for k = 1:length(x_axis)
    [rel_tol(k), abs_tol(k)] = DetermineAverageEigenvectorPrecision(x_axis(k), num_trials); 
end

PlotPrecisionTrials(title1, title2, saveas_name1, saveas_name2, x_label, y_label, x_axis, 'Rel Tol Against eig', 'Abs Tol Against eig', rel_tol, abs_tol, num_trials);
