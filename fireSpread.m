function [] = fireSpread(density, wind, varargin)
    nVarargs = length(varargin);
    if nVarargs == 0
        x = 50;
        y = 50;
    elseif nVarargs == 1
        x = varargin{1};
        y = 50;
    elseif nVarargs == 2
        x = varargin{1};
        y = varargin{2};     
    end

    F = simulation(density);

    Spread = [0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1];
    t = 0;                                                                  

    for ii =  1:length(x)
        F(x(ii), y(ii)) = 1;
    end

    %% LOOPS
    while ~isempty(find(F == 1, 1))                                         %Loop only runs while there are fires
        [i, j] = find(F == 1);                                              %Coordinates of the fire
        for x = 1:length(i)                                                 %For each fire
            for M = 1:8                                                     %Checking each spreading option
                try                                                         %Makes it so off grid checks don't cause an error
                    if F(i(x) + Spread(M), j(x) + Spread(M + 8))== 0        %Checking for trees
                        if randi([1, 100]) <= wind                          %Chance a tree will ignite
                        F(i(x)+Spread(M), j(x) + Spread(M + 8)) = 1;        %Fire spreads to found trees
                        end
                    end
                end
                F(i(x),j(x)) = 2;                                           %Trees that have been burned             
            end
        end
    pause(1/10);
    imagesc(F); 
    drawnow; 
    title(['t = ' num2str(t)])                                              
    t = t + 1;                                                             
    end
end