function [] = Problem_1()

    %%%%%%
    % Finds the root of a function of two variables, using the bisection method.
    %   Ryan Skinner, September 2015
    %%%
    
    Set_Default_Plot_Properties();

    % Initialize functions.
    x1 = @(x2) sqrt(x2) - x2 + (1/4);
    f  = @(x2) 8*x1(x2).^2 - 8*x1(x2).*x2 + 16*x2 - 5;
    
    % Find x2.
    initial = 0.3;
    h = 0.3;
    [x2, guesses] = Bisect1D(f, initial, h, 10^-6);
    
    % Display results.
    fprintf('x1: %.10f\n', x1(x2));
    fprintf('x2: %.10f\n',    x2);
    
    figure();
    hold on;
    abscissa = 0:(length(guesses)-1);
    plot(abscissa, 0.25 * ones(1,length(abscissa)));
    plot(abscissa, guesses, 'o-');
    xlabel('Iteration');
    ylabel('x_2');
    hleg = legend('0.25', 'Lower Bound', 'Midpoint', 'Upper Bound');
    
end