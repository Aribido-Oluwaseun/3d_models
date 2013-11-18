function [coordinates_of_spherical_harmonics_for_particular_bones, struct_of_spherical_harmonics_for_particular_bones] = spherical_harmonics_for_particular_bones(struct_of_normalized_xyz_for_n_bones_in_foot, number_of_bones_in_foot)
%INPUTS normalized coordinates of praticular bones in foot
%OUTPUTS  sphericalr harmonics ready to plot

field_names = fieldnames(struct_of_normalized_xyz_for_n_bones_in_foot);
[number_of_fields, n] = size(field_names);

for i=1:number_of_fields
        
        x = struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,1);
        y = struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,2);
        z = struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,3);
        [bhat, xhat, yhat, zhat] = spherical_harmonics(x, y, z, 10);
        
        coordinates_of_spherical_harmonics_for_particular_bones.(char(field_names(i))) = [xhat yhat zhat] ;
        struct_of_spherical_harmonics_for_particular_bones.(char(field_names(i))) = bhat ;

end



end