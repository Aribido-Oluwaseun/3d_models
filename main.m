
close all
clear all

[FileName, PathName] = uigetfile('.stl','C:\Users\Aleksandra\Desktop\W11\image_proc_proof\STLRead\stl_files');
addpath(PathName);
display('stlread is running')
fv = stlread(FileName); 

% plot_solid_from_stl(fv)
save temp fv
 
%load temp
display('extract_coorinates_from_stl is running')
[x, y, z] = extract_coorinates_from_stl(fv);


data = [x,y,z];

plotoption = 0;

display('kmeans_for_3d is running')
[groups_for_feet, centers_for_feet] = kmeans_for_3d(data,2,plotoption); % find left and right foot

display('find_geometric_center for the first foot is running')
[x_center_foot1, y_center_foot1, z_center_foot1, x_foot1, y_foot1, z_foot1] = find_geometric_center(groups_for_feet,x,y,z, 1, 100);

display('find_geometric_center for second foot is running')
[x_center_foot2, y_center_foot2, z_center_foot2, x_foot2, y_foot2, z_foot2] = find_geometric_center(groups_for_feet,x,y,z, 2, 100);


display('find_calcaneus for the first foot is running')
[groups_of_bones_foot1, centers_for_bones_in_foot1, struct_of_xyz_for_n_bones_in_foot1] = find_particular_bones(x_foot1, y_foot1, z_foot1);

display('find_calcaneus for the second foot is running')
[groups_of_bones_foot2, centers_for_bones_in_foot2, struct_of_xyz_for_n_bones_in_foot2] = find_particular_bones(x_foot2, y_foot2, z_foot2);

display('find_geometric_center_for_particular_bones for the first foot is running')
[struct_of_xyz_centers_for_n_bones_in_foot1, number_of_bones_foot1] = find_geometric_center_for_particular_bones(struct_of_xyz_for_n_bones_in_foot1, 10);

display('find_geometric_center_for_particular_bones for the second foot is running')
[struct_of_xyz_centers_for_n_bones_in_foot2, number_of_bones_foot2] = find_geometric_center_for_particular_bones(struct_of_xyz_for_n_bones_in_foot2, 10);

display('normalize is running')


x_foot1n = normalize(x_foot1-x_center_foot1);
y_foot1n = normalize(y_foot1-y_center_foot1);   
z_foot1n = normalize(z_foot1-z_center_foot1);

x_foot2n = normalize(x_foot2-x_center_foot2);
y_foot2n = normalize(y_foot2-y_center_foot2);   
z_foot2n = normalize(z_foot2-z_center_foot2);




foot1= [x_foot1n, y_foot1n, z_foot1n];
foot2= [x_foot2n, y_foot2n, z_foot2n];


struct_of_normalized_xyz_for_n_bones_in_foot1 = normalization(struct_of_xyz_for_n_bones_in_foot1, struct_of_xyz_centers_for_n_bones_in_foot1);
struct_of_normalized_xyz_for_n_bones_in_foot2 = normalization(struct_of_xyz_for_n_bones_in_foot2, struct_of_xyz_centers_for_n_bones_in_foot2);




display('spherical_harmonics is running (1st foot)')
[bhat1, xhat1, yhat1, zhat1] = spherical_harmonics(x_foot1n, y_foot1n, z_foot1n, 10);
%  plotowanie
figure, subplot(1,2,1), plot3(x_foot1n, y_foot1n, z_foot1n,'.'); title('Real foot'); view(-49,-14); axis([-1 1 -1 1 -1 1])
subplot(1,2,2), plot3(xhat1, yhat1, zhat1, 'r.'); title('Model foot'); view(-49,-14); axis([-1 1 -1 1 -1 1])


display('spherical_harmonics is running (2nd foot)')
[bhat2, xhat2, yhat2, zhat2] = spherical_harmonics(x_foot2n, y_foot2n, z_foot2n, 10);

figure, subplot(1,2,1), plot3(x_foot2n,y_foot2n,z_foot2n,'.'); view(-49,-14);title('Real foot');axis([-1 1 -1 1 -1 1])
subplot(1,2,2), plot3(xhat2, yhat2, zhat2,'r.'); title('Model foot');view(-49,-14);axis([-1 1 -1 1 -1 1])

plot_sh_coeff(bhat1, bhat2)
compare_sh_coeff(bha1,bhat2)
plot_convn_of_sh_coef(bhat1, bhat2)


display('spherical_harmonics_for_particular_bones is running (1st foot)')
[coordinates_of_spherical_harmonics_for_particular_bones_foot1, struct_of_coef_spherical_harmonics_for_particular_bones_foot1] = spherical_harmonics_for_particular_bones(struct_of_normalized_xyz_for_n_bones_in_foot1, number_of_bones_foot1);
display('spherical_harmonics_for_particular_bones is running (2nd foot)')
[coordinates_of_spherical_harmonics_for_particular_bones_foot2, struct_of_coef_spherical_harmonics_for_particular_bones_foot2] = spherical_harmonics_for_particular_bones(struct_of_normalized_xyz_for_n_bones_in_foot2, number_of_bones_foot2);



figure_title = disp_or_write_msg_var('Particular bones of foot: ', foot1);   
plot_sh_model_and_real_bone(coordinates_of_spherical_harmonics_for_particular_bones_foot1, struct_of_normalized_xyz_for_n_bones_in_foot1, figure_title)
figure_title2 = disp_or_write_msg_var('Particular bones of foot: ', foot2);   
plot_sh_model_and_real_bone(coordinates_of_spherical_harmonics_for_particular_bones_foot2, struct_of_normalized_xyz_for_n_bones_in_foot2, figure_title2)


plot_sh_coeff_for_particular_bones(struct_of_coef_spherical_harmonics_for_particular_bones_foot1,struct_of_coef_spherical_harmonics_for_particular_bones_foot2)


% 
%  
%  figure, plot3(x_foot1, y_foot1, z_foot1,'b.')
%  hold on 
%  plot3(x_center_foot1,y_center_foot1,z_center_foot1,'ro')   
%  hold off 
%  
%  
%  figure, plot3(x_foot2, y_foot2, z_foot2 ,'b.')
%  hold on 
%  plot3(x_sr2,y_sr2,z_sr2,'ro')   
%  hold off 
 