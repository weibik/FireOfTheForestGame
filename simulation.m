function [] = simulation(density)
    resolution = 100;
    myColors = [0 0.5 0; 1 0 0; 0 0 0; 1 1 1];
    forest = zeros(resolution); 
    Pn = zeros(1, resolution);
    Pn(1:(resolution - density)) = 3; 

    for i = 1:resolution
        for j = 1:resolution
            forest(i,j) = forest(i,j)+Pn(randi(length(Pn))); 
        end
    end

    imagesc(forest) 
    colormap(myColors) 
    hold on
    axis off
    set(gca,'yticklabel',[],'xticklabel',[],'xtick',[],'ytick',[]) 
end