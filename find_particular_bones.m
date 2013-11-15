function [g, c, struct_of_xyz_for_n_bones_in_foot] = find_particular_bones(x,y,z)
    data = [x,y,z];
    plotoption = 0;
    numbers_of_groups = 3;
    [g,c] = kmeans_for_3d(data, numbers_of_groups, plotoption);
    
      
    for i=1:numbers_of_groups
        ind = find(g == i);
        xg = x(ind); 
        yg = y(ind); 
        zg = z(ind);
        field_name = sprintf('number_of_group%d',i);
        struct_of_xyz_for_n_bones_in_foot.(field_name) = [xg yg zg];
        subplot(1,numbers_of_groups,i), plot3(xg, yg, zg,'g.'); view(-49,-14); axis square; title('...');
        
    end
    
  
end
