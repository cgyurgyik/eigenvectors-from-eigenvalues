function PlotPrecisionTrials(plot_title1, plot_title2, saveas_name_1, saveas_name_2, x_label, y_label, x_axis, legend1_name, legend2_name, y1, y2, num_trials)
    close all;
    figure;
    p1 = plot(x_axis, y1);
    p1(1).LineWidth = 2;
    p1(1).Color = 'r';
    title(plot_title1);
    xlabel(x_label);
    ylabel(y_label);
    legend(legend1_name);
    txt = {['      Number of trials per matrix size: ', num2str(num_trials)]};
    text(x_axis(2), y1(length(y1) - 1), txt);
    saveas(gcf, saveas_name_1);
    
    figure;
    p2 = plot(x_axis, y2);
    p2(1).LineWidth = 2;
    p2(1).Color = 'b';
    
    title(plot_title2);
    xlabel(x_label);
    ylabel(y_label);
    legend(legend2_name);
    txt = {['      Number of trials per matrix size: ', num2str(num_trials)]};
    text(x_axis(2), y2(length(y2) - 1), txt);
    saveas(gcf, saveas_name_2);
end
