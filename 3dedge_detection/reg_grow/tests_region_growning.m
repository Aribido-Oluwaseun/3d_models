[dicom_cube,xthickness, ythickness,zthickness] = gather_dicom_cube;
[bones3d,p,q,r] = multithresholding_for_3d(dicom_cube); %find bone in 3d
plot_3d_thresholded(p,q,r, bones3d, 100);
bones_cube = save_bones3d_to_3d_matrix_as_bw(bones3d);
load segmented_bones %instead of region_growing 3d


%plot_region_growing_bones_3d(struct_of_bones_coordinates_3d,10)
bones_xyz = matrix3d_to_xyz_coordinates(bones3d);
[G, C]= divide_into_two_feet(bones_xyz,0);