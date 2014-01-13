
function run_region_growing_on_slice(number_of_contours)
% run_region_growing_on_slice finds the countour in segemtned image
%   INPUTS: number of contours, you would like to find

dicom_cube = gather_dicom_cube;

image = choose_dicom_image(dicom_cube,'axial',220);
[thresh, segmented_image] = multithresholding(image, 4);
[struct_segmented_images, bone] = extract_tissue_layers(segmented_image, thresh);

struct_of_contours = region_growing(bone, number_of_contours);
%branch----------contours_with_morphological_operations--------------
contoured_wih_morphological_operation_image = morphological_contouring(bone);

%branch ---------multithreshold in 3d

[bones3d,p,q,r] = multithresholding_for_3d(dicom_cube);
%-----------------plot 3d bones and plot "movie" from bones------
plot_3d_layer(p,q,r, bones3d)
plot_movie_layer(dicom_cube, bones3d, p, q, r)

end