function [ output_args ] = run_automatic_region_growing_for3d( input_args )
%RUN_AUTOMATIC_REGION_GROWING_FOR3D Summary of this function goes here
%   Detailed explanation goes here


dicom_cube = gather_dicom_cube;
[p,q,r]=size(dicom_cube);
tested_multithresholded = multithresholding(dicom_cube(:,:,floor(r/2)),2);

[cortical_bone, trabecular_bone,p,q,r] = multithresholding_for_3d(dicom_cube,2); %find bone in 3d
plot_3d_thresholded(p,q,r, trabecular_bone, 100);
figure, plot_3d_thresholded(p,q,r, cortical_bone, 100);

bones_cube_trabecular = save_bones3d_to_3d_matrix_as_bw(trabecular_bone);
bones_cube_cortical = save_bones3d_to_3d_matrix_as_bw(cortical_bone);

load segmented_bones
%struct_of_bones_coordinates_3d = find_all_bones_coorinates_for_3d(bones_cube)
%plot_region_growing_bones(struct_of_bones_coordinates_3d, bones3d)
plot_region_growing_bones_3d(struct_of_bones_coordinates_3d,10)


bones_xyz = matrix3d_to_xyz_coordinates(bones3d);


end

