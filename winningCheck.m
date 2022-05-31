function [result] = winningCheck(forest)

    alive = 0;  % 0
    burned = 0;   % 2
    empty = 0;  % 3

    F = forest;

    for i = 1 : length(forest)
        for j = 1 : length(forest)
            if F(i, j) == 0
                alive = alive + 1;
            elseif F(i, j) == 2
                 burned = burned + 1;
            elseif F(i, j) == 3
                empty = empty + 1;
            end
        end
    end

    grid = 10000 - empty; 
    if (grid - alive < grid - burned)
        result = true;
    else
        result = false;
    end


  