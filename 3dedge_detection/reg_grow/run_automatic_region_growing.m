
function run_automatic_region_growing()
% run_region_growing_on_slice finds the countour in segemtned image
%   INPUTS: number of contours, you would like to find

dicom_cube = gather_dicom_cube;

image = choose_dicom_image(dicom_cube,'axial',140);
[thresh, segmented_image] = multithresholding(image, 2);
[struct_segmented_images, bone] = extract_tissue_layers(segmented_image, thresh);
%filled_bone = imfill(bone,'holes');
[struct_of_bones_coordinates] = find_all_bones_coorinates(bone)

plot_region_growing_bones(struct_of_bones_coordinates, bone)


end