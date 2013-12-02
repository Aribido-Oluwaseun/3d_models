function [g, c, struct_of_xyz_for_n_bones_in_foot] = find_particular_bones(x,y,z)
    data = [x,y,z];
    plotoption = 0;
    numbers_of_groups = 3;
    [g,c] = kmeans_for_3d(data, numbers_of_groups, plotoption);
    
    %figure 
    for i=1:numbers_of_groups
        ind = find(g == i);
        xg = x(ind); 
        yg = y(ind); 
        zg = z(ind);
        field_name = sprintf('number_of_group%d',i);
        struct_of_xyz_for_n_bones_in_foot.(field_name) = [xg yg zg];
        
        nx = struct_of_xyz_for_n_bones_in_foot.(field_name)(:,1);
        ny = struct_of_xyz_for_n_bones_in_foot.(field_name)(:,2);
        nz = struct_of_xyz_for_n_bones_in_foot.(field_name)(:,3);
        
        model = [nx ny nz];
        
        
        
        
        
        
        %build_slices_3d_model(x,y,z);
        
        
        
        %subplot(1,numbers_of_groups,i), plot3(xg, yg, zg,'g.'); view(-49,-14); title('Particular bones in foot'); axis square;
    end
    
    
  
end
