function [struct_of_normalized_xyz_for_n_bones_in_foot] = normalization(struct_of_xyz_for_n_bones_in_foot, struct_of_xyz_centers_for_n_bones_in_foot)
%INPUT  cooridinates of particular bones in foot, coordinates of centers of
%particular bones in foot
%OUTPUTS normalized cooridinates of particular bones in foot

field_names = fieldnames(struct_of_xyz_for_n_bones_in_foot);

[number_of_fields, n] = size(field_names);
    
    for i=1:number_of_fields
        x = struct_of_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,1);
        y = struct_of_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,2);
        z = struct_of_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,3);
        
        x_center = struct_of_xyz_centers_for_n_bones_in_foot.(char(field_names(i)))(:,1);
        y_center = struct_of_xyz_centers_for_n_bones_in_foot.(char(field_names(i)))(:,2);
        z_center = struct_of_xyz_centers_for_n_bones_in_foot.(char(field_names(i)))(:,3);
        
        x_norm = normalize(x - x_center);
        y_norm = normalize(y - y_center);
        z_norm = normalize(z - z_center);
        
        
       struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i))) = [x_norm y_norm z_norm];
    end
        
        
        
        
end

