
function automatic_region_growing()
% run_region_growing_on_slice finds the countour in segemtned image
%   INPUTS: number of contours, you would like to find

dicom_cube = gather_dicom_cube;

image = choose_dicom_image(dicom_cube,'axial',220);
[thresh, segmented_image] = multithresholding(image, 4);
[struct_segmented_images, bone] = extract_tissue_layers(segmented_image, thresh);
%filled_bone = imfill(bone,'holes');

[m, n] = size(bone);
init_pos = [];
contours_counter = 0;
for i=1:m
        for j=1:n
            
            if bone(i,j)== 1
            init_pos = [i,j,1];
            
            contour = regionGrowing(bone, init_pos);
            contour_to_substract = save_contour_in_bw_image_in_slice_size(bone, contour);
            filled_contour = imfill(contour_to_substract,'holes');
            
            contours_counter = contours_counter +1;
            field_name = sprintf('bone%d',contours_counter); 
            [x,y]= find(filled_contour==1) % find coordinates of filled contour
            struct_of_bones_coordinates.field_name = [x,y]
            
            new_bone = bone - filled_contour;
            
           
            
            end
        end
end


end