function PlotPrecisionTrials(plot_title, saveas_name, x_label, y_label, x_axis, y)
    close all;
    figure;
    p = plot(x_axis, y, '*');
    p(1).LineWidth = 1;
    p(1).Color = 'r';
    title(plot_title);
    xlabel(x_label);
    ylabel(y_label);
    grid on;
    saveas(gcf, saveas_name);
    
end
