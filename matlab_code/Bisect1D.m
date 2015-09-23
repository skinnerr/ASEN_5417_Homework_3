function [ x0, x_guesses ] = Bisect1D( f, x_initial, h, tol )

    %%%%%%
    % Simple bisection method to find root of function, f(x), based on an initial guess
    %  of the interval (x_initial +/- h). Solution is found when the interval decreases
    %  below the tolerance, tol.
    %%%
    
    % Initialize the three test points.
    x = [ x_initial - h; ...
          x_initial;     ...
          x_initial + h ]';
    
    % Initialize reporting data.
    x_guesses = x;
    
    % Iterate until tolerance is met.
    interval = inf;
    while interval > tol
        
        % Determine where sign changes and update the interval if needed.
        fx = f(x);
        sign_change = (diff(sign(fx)) ~= 0);
        if sign_change(1)
            x = [ x(1);         ...
                  mean(x(1:2)); ...
                  x(2) ]';
        elseif sign_change(2)
            x = [ x(2);         ...
                  mean(x(2:3)); ...
                  x(3) ]';
        else
            error('No sign change within interval.');
        end
        
        % Re-calculate interval.
        interval = abs( x(3) - x(1) );
        
        % Catalog the current guess.
        x_guesses = cat(1, x_guesses, x);
        
    end
    
    % Return mid-point of interval.
    x0 = x(2);

end

