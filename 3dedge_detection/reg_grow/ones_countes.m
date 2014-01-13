function init_pos = initate_position_to_region_growing_2d(image)
    [m, n] = size(image);
    init_pos = [];
    for i=1:m
        for j=1:n
            if image(i,j)==1
            init_pos = [i,j,1];
                   
            end
        end
    end
end

        
            