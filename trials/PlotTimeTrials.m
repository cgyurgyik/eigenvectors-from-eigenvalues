function PlotTimeTrials(plot_title, saveas_name, x_label, y_label, x_axis, legend1_name, legend2_name, ev_fn_times, gefe_fn_times, num_trials)
    close all;
    figure;
    p = plot(x_axis, ev_fn_times, x_axis, gefe_fn_times);
    p(1).LineWidth = 2;
    p(1).Color = 'r';
    p(2).LineWidth = 2;
    p(2).Color = 'b';
    
    title(plot_title);
    xlabel(x_label);
    ylabel(y_label);
    legend(legend1_name, legend2_name);
    txt = {'      Currently does not account for precision.', ['      Number of trials per matrix size: ', num2str(num_trials)]};
    text(x_axis(2), ev_fn_times(length(ev_fn_times) - 1), txt);
    saveas(gcf, saveas_name);
end
