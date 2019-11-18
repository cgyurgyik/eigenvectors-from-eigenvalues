num_trials = 10;
x_axis = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000];

ev_fn_times = zeros(1, length(x_axis));
gefe_fn_times = zeros(1, length(x_axis));


for k = 1:length(x_axis)
    [ev_fn_times(k), gefe_fn_times(k)] = time_trials(x_axis(k), num_trials, @eig); 
end

title = 'Time to Get 1 Random Eigenvector vs. N x N Matrix';
x_label = 'N';
y_label = 'Time (s)';
plot_time_trials(title, x_label, y_label, x_axis, @eig, ev_fn_times, gefe_fn_times, num_trials);
