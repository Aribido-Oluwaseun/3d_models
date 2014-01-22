function [ output_args ] = run_automatic_region_growing_for3d( input_args )
%RUN_AUTOMATIC_REGION_GROWING_FOR3D Summary of this function goes here
%   Detailed explanation goes here


dicom_cube = gather_dicom_cube;
[bones3d,p,q,r] = multithresholding_for_3d(dicom_cube); %find bone in 3d
plot_3d_thresholded(p,q,r, bones3d, 100);
bones_cube = save_bones3d_to_3d_matrix_as_bw(bones3d);
struct_of_bones_coordinates_3d = find_all_bones_coorinates_for_3d(bones_cube)
%plot_region_growing_bones(struct_of_bones_coordinates_3d, bones3d)
plot_region_growing_bones_3d(struct_of_bones_coordinates_3d,bones_cube,10,50)

end
