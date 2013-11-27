function plot_sh_coeff_for_particular_bones(struct_of_coef_spherical_harmonics_for_particular_bones_foot1, struct_of_coef_spherical_harmonics_for_particular_bones_foot2)

field_names = fieldnames(struct_of_coef_spherical_harmonics_for_particular_bones_foot1);
[number_of_fields, n] = size(field_names);
  figure('name','sh_coeff_for_particular_bones') 
    for i=1:number_of_fields
       
        sbhat1 = struct_of_coef_spherical_harmonics_for_particular_bones_foot1.(char(field_names(i)));
        sbhat2 = struct_of_coef_spherical_harmonics_for_particular_bones_foot2.(char(field_names(i)));

       
        subplot(4,number_of_fields,i), plot(sbhat1); title(field_names(i)); ylabel('foot1 bhat');
        subplot(4,number_of_fields,(i+3)), plot(sbhat2); ylabel('foot2 bhat');
        subplot(4,number_of_fields,(i+6)), plot(sbhat1,'r'); ylabel('foot 1 and fsoot2 bhat'); hold on; plot(sbhat2,'b'); hold off
        subplot(4,number_of_fields,(i+9)), plot(convn(sbhat1,sbhat2)); ylabel('convn(bhat1,bhat2)');
        
        
    end
    
end