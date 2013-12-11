% close all
% clear
function region_growing_on_slice()

dicom_cube = gather_dicom_cube;
image = choose_dicom_image(dicom_cube,'axial',120);
image2 = find_bones_by_region_growing(image,500);


end