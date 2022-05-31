function [forest] = fireSpread(handles, sim, wind, timeOfPause, varargin)
    clc;
    cla;

    forest = sim;
   
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
                    forest(i, j) = 3;
                end
            end
        end       
    end

    spread = [0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1];      
    
    for ii =  1:length(x)
        forest(x(ii), y(ii)) = 1;
    end
    
   
    while ~isempty(find(forest == 1, 1))                                        
        [i, j] = find(forest == 1);                                              
        for x = 1:length(i)                                                 
            for neighbour = 1:8                                                     
                try                                                         %#ok<TRYNC> 
                    if forest(i(x) + spread(neighbour), j(x) + spread(neighbour + 8)) == 0       
                        if randi([1, 100]) <= wind                          
                            forest(i(x) + spread(neighbour, j(x) + spread(neighbour + 8)) = 1;        
                        end
                    end                    
                end
                forest(i(x),j(x)) = 2;                                        
            end
        
        end

        pause(timeOfPause);
        imagesc(forest); 
        drawnow; 

        if isappdata(handles.tag_simulation,'stopPlot')
            break;
        end
    end

