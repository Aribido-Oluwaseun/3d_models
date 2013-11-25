function plot_sh_coeff_for_particular_bones(struct_of_coef_spherical_harmonics_for_particular_bones_foot1, struct_of_coef_spherical_harmonics_for_particular_bones_foot2)

field_names = fieldnames(struct_of_coef_spherical_harmonics_for_particular_bones_foot1);
[number_of_fields, n] = size(field_names);
    figure,
    for i=1:number_of_fields
        bhat1 = struct_of_coef_spherical_harmonics_for_particular_bones_foot1.(char(field_names(i)));
        bhat2 = struct_of_coef_spherical_harmonics_for_particular_bones_foot2.(char(field_names(i)));

       
        subplot(3,number_of_fields,i), plot(bhat1);title('foot1');
        subplot(3,number_of_fields,(i+3)), plot(bhat1); title('foot2');
        subplot(3,number_of_fields,(i+6)), plot(convn(bhat1,bhat2)); title('correlation of sh coef for left and right foot');
    end
    
end