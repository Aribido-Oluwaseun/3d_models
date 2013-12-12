% close all
% clear
function region_growing_on_slice()

dicom_cube = gather_dicom_cube;
image = choose_dicom_image(dicom_cube,'axial',220);
[segmented_image, rgb, gray_segmented_image] = multithresholding(image, 4);
[poly, image2] = find_bones_by_region_growing(gray_segmented_image, 2);


end