
function automatic_region_growing()
% run_region_growing_on_slice finds the countour in segemtned image
%   INPUTS: number of contours, you would like to find

dicom_cube = gather_dicom_cube;

image = choose_dicom_image(dicom_cube,'axial',220);
[thresh, segmented_image] = multithresholding(image, 4);
[struct_segmented_images, bone] = extract_tissue_layers(segmented_image, thresh);
filled_bone = imfill(bone,'holes');

[m, n] = size(filled_bone);
init_pos = [];
for i=1:m
        for j=1:n
            if filled_bone(i,j)==1
            init_pos = [i,j,1];
            cont = regionGrowing(filled_bone, init_pos);
            %coordinates_inside_contour =
            %find_coordinates_inside_contour(cont);
            
            %countour_decreased_bone = filled_bone - coordinates_inside_contour
            
            
            
            end
        end
end


end