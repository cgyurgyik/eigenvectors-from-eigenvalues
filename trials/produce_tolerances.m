x_axis = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, ...
    200, 300, 400, 500, 600, 700, 800, 900, 1000,  ...
    1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000];

num_trials = 5;

title = 'Average Absolute Tolerance Compared to eig';
x_label = 'N';
y_label = 'Tolerance';
saveas_name = 'AvgAbsTolerance';

abs_tol = zeros(1, length(x_axis));


for k = 1:length(x_axis)
    abs_tol(k) = DetermineAverageEigenvectorPrecision(x_axis(k), num_trials);
end

PlotPrecisionTrials(title, saveas_name, x_label, y_label, x_axis, abs_tol);
