function [struct_of_xyz_centers_for_n_bones_in_foot, number_of_fields] = find_geometric_center_for_particular_bones(struct_of_xyz_for_n_bones,ss)
%
%INPUT struct with x y z coordinates for particular bones in the foot, ss
%-subsumpling 
%OUPUT geopetric center x_center, y_center, z_center of each bone

field_names = fieldnames(struct_of_xyz_for_n_bones);
[number_of_fields, n] = size(field_names);
    
    for i=1:number_of_fields
        x = struct_of_xyz_for_n_bones.(char(field_names(i)))(:,1);
        y = struct_of_xyz_for_n_bones.(char(field_names(i)))(:,2);
        z = struct_of_xyz_for_n_bones.(char(field_names(i)))(:,3);
        
        x_ss = x(1:ss:end);
        y_ss = y(1:ss:end);
        z_ss = z(1:ss:end);
      
        xsr = sum(x_ss(:))/length(x_ss);
        ysr = sum(y_ss(:))/length(y_ss);
        zsr = sum(z_ss(:))/length(z_ss);
        
        struct_of_xyz_centers_for_n_bones_in_foot.(char(field_names(i))) = [xsr ysr zsr];
        
    end
        
end