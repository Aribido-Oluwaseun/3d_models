function plot_sh_model_and_real_bone(coordinates_of_spherical_harmonics_for_particular_bones_foot, struct_of_normalized_xyz_for_n_bones_in_foot, figure_title)


field_names = fieldnames(coordinates_of_spherical_harmonics_for_particular_bones_foot);

[number_of_fields, n] = size(field_names);
figure('name', figure_title);

    for i=1:number_of_fields
        x = coordinates_of_spherical_harmonics_for_particular_bones_foot.(char(field_names(i)))(:,1);
        y = coordinates_of_spherical_harmonics_for_particular_bones_foot.(char(field_names(i)))(:,2);
        z = coordinates_of_spherical_harmonics_for_particular_bones_foot.(char(field_names(i)))(:,3);
        
        xn = struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,1);
        yn = struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,2);
        zn = struct_of_normalized_xyz_for_n_bones_in_foot.(char(field_names(i)))(:,3);
                        
        subplot(2,number_of_fields,i), plot3(xn,yn,zn,'b.'); view(-49,-14);title('Real foot');axis([-1 1 -1 1 -1 1])
               
        subplot(2,number_of_fields,(i+3)), plot3(x,y,z,'b.'); title('Model foot');view(-49,-14);axis([-1 1 -1 1 -1 1])
        
    end



end

