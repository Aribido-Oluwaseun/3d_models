
function run_region_growing_on_slice(number_of_contours)
% run_region_growing_on_slice finds the countour in segemtned image
%   INPUTS: number of contours, you would like to find

dicom_cube = gather_dicom_cube;
image = choose_dicom_image(dicom_cube,'axial',220);
[thresh, segmented_image] = multithresholding(image, 4);
[struct_segmented_images, bone] = extract_tissue_layers(segmented_image, thresh);


% contours = region_growing(image,number_of_contours)

contours = region_growing(bone, number_of_contours)
%branch
% bwmorph(' remove')



%region_growing(bone,number_of_contours)

end