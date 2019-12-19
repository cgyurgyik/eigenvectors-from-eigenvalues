x_axis = [100, ...
    200, 300, 400, 500, 600, 700, 800, 900, 1000,  ...
    1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 5500];

num_trials = 10;

title = 'Average Absolute Tolerance';
x_label = 'N'; % Size of N x N matrix.
y_label = 'Tolerance';
saveas_name = 'AvgAbsTolerance';

abs_tol = zeros(1, length(x_axis));


for k = 1:length(x_axis)
    abs_tol(k) = DetermineAverageEigenvectorPrecision(x_axis(k), num_trials); 
end

PlotPrecisionTrials(title, saveas_name, x_label, y_label, x_axis, abs_tol);
