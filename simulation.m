function [] = simulation(p)
    n = 100;
    colour=[0 0.5 0; 1 0 0; 0 0 0; 1 1 1];
    F = zeros(n); 
    Pn = zeros(1,100);
    Pn(1:(100 - p)) = 3; 
    for i = 1:n
        for j = 1:n
            F(i,j) = F(i,j)+Pn(randi(length(Pn))); 
        end
    end
    imagesc(F) 
    colormap(colour) 
    hold on
    axis off
    set(gca,'yticklabel',[],'xticklabel',[],'xtick',[],'ytick',[]) %Removing ticks
end