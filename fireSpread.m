function [forest] = fireSpread(handles, sim, wind, timeOfPause, varargin)
    clc;
    cla;

    F = sim;
   
    nVarargs = length(varargin);
    if nVarargs == 0
        x = 50;
        y = 50;
    elseif nVarargs == 1
        x = varargin{1};
        y = 50;
    elseif nVarargs == 2
        y = varargin{1};
        x = varargin{2};   
    elseif nVarargs == 4
        y = varargin{1};
        x = varargin{2};  
        firefigthersX = varargin{4};
        firefigthersY = varargin{3}; 

        for ii = 1:length(firefigthersX)
            for i = firefigthersX(ii) - 5 : firefigthersX(ii) + 5
                for j = firefigthersY(ii) - 5 : firefigthersY(ii) + 5
                    F(i, j) = 3;
                end
            end
        end       
    end

    spread = [0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1];      
    

    for ii =  1:length(x)
        F(x(ii), y(ii)) = 1;
    end
    
   

    %% LOOPS
    while ~isempty(find(F == 1, 1))                                        
        [i, j] = find(F == 1);                                              
        for x = 1:length(i)                                                 
            for M = 1:8                                                     
                try                                                         %#ok<TRYNC> 
                    if F(i(x) + spread(M), j(x) + spread(M + 8)) == 0       
                        if randi([1, 100]) <= wind                          
                            F(i(x) + spread(M), j(x) + spread(M + 8)) = 1;        
                        end
                    end                    
                end
                F(i(x),j(x)) = 2;                                        
            end
        
        end

        pause(timeOfPause);
        imagesc(F); 
        drawnow; 

        if isappdata(handles.tag_simulation,'stopPlot')
            break;
        end
    end

    forest = F;

