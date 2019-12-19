contesting_eigenvector_function = @eig;

x_axis = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, ...
    200, 300, 400, 500, 600, 700, 800, 900, 1000,  ...
    1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000];

num_trials = 10;

title = 'Average Time to Get One Random Eigenvector vs. N x N Matrix';
x_label = 'N';
y_label = 'Time (s)';
saveas_name = 'AverageTimeTrials';

ev_fn_times = zeros(1, length(x_axis));
gefe_fn_times = zeros(1, length(x_axis));


for k = 1:length(x_axis)
    [ev_fn_times(k), gefe_fn_times(k)] = TimeToRetrieveRandomEigenvector(x_axis(k), num_trials, @eig); 
end

ev_fn_times = ev_fn_times ./ num_trials;
gefe_fn_times = gefe_fn_times ./ num_trials;

PlotTimeTrials(title, saveas_name, x_label, y_label, x_axis, func2str(contesting_eigenvector_function), 'GEFE', ev_fn_times, gefe_fn_times, num_trials);
