
function run_region_growing_on_slice(number_of_contours)
% run_region_growing_on_slice finds the countour in segemtned image
%   INPUTS: number of contours, you would like to find

dicom_cube = gather_dicom_cube;
image = choose_dicom_image(dicom_cube,'axial',220);
[segmented_image, rgb] = multithresholding(image, 4);

for i=1:number_of_contours
poly = regionGrowing(segmented_image);
hold all;
plot(poly(:,1), poly(:,2), 'LineWidth', 2)
end


end