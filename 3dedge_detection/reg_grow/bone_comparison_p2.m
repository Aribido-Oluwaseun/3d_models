

dicom_cube = gather_dicom_cube;
[bones3d,p,q,r] = multithresholding_for_3d(dicom_cube,4); %find bone in 3d
plot_3d_thresholded(p,q,r, bones3d, 100);
bones_cube = save_bones3d_to_3d_matrix_as_bw(bones3d);
bones_xyz = matrix3d_to_xyz_coordinates(bones3d);

load foot_p2_patryk
non_zero_bones = find_all_non_zero_bones(struct_of_bones_coordinates_3d);
%struct_of_bones_coordinates_3d = find_all_bones_coorinates_for_3d(bones_cube)

%plot_region_growing_bones(struct_of_bones_coordinates_3d, bones3d)
figure, plot_region_growing_bones_3d(struct_of_bones_coordinates_3d,10);

calc1 = non_zero_bones.bone2469; %calcaneus 1 part2
calc21 = non_zero_bones.bone1593; %calcaneus 1 part1
calc22 = non_zero_bones.bone1020;
calc2=[calc21;calc22];

subsampling = 1;
figure,
plot_bones(calc1,subsampling);
hold on
plot_bones(calc2,subsampling);
hold off


[xc1,yc1,zc1,x1,y1,z1] = find_centre_of_bone(calc1);
[xc2,yc2,zc2,x2,y2,z2] = find_centre_of_bone(calc2);
   
   
[x1n, norm_coeff_x1] = normalize(x1-xc1);
[y1n, norm_coeff_y1] = normalize(y1-yc1);   
[z1n, norm_coeff_z1] = normalize(z1-zc1);

[x2n, norm_coeff_x2] = normalize(x2-xc2);
[y2n, norm_coeff_y2] = normalize(y2-yc2);   
[z2n, norm_coeff_z2] = normalize(z2-zc2);


[bhat1, xhat1, yhat1, zhat1] = spherical_harmonics(x1n, y1n, z1n, 10);
[bhat2, xhat2, yhat2, zhat2] = spherical_harmonics(x2n, y2n, z2n, 10);
 

% ----------------------- calcaneus comparison

figure, subplot(1,2,1), plot3(x1n, y1n, z1n,'.'); title('Real foot'); view(-49,-14); axis([-1 1 -1 1 -1 1])
subplot(1,2,2), plot3(xhat1, yhat1, zhat1, 'r.'); title('Model foot'); view(-49,-14); axis([-1 1 -1 1 -1 1])

figure, subplot(1,2,1), plot3(x2n,y2n,z2n,'.'); view(-49,-14);title('Real foot');axis([-1 1 -1 1 -1 1])
subplot(1,2,2), plot3(xhat2, yhat2, zhat2,'r.'); title('Model foot');view(-49,-14);axis([-1 1 -1 1 -1 1])


plot_sh_coeff(bhat1, bhat2)
compare_sh_coeff(bhat1,bhat2)
plot_convn_of_sh_coef(bhat1, bhat2)
