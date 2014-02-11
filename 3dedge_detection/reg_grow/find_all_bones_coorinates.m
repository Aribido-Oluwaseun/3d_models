function [struct_of_bones_coordinates, contours_counter] = find_all_bones_coorinates(bone)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


[m, n] = size(bone);
init_pos = [];
contours_counter = 1;

for i=1:m
        for j=1:n
            
            if bone(i,j)== 1
            init_pos = [i,j,1];
            
            contour = regionGrowing(bone, init_pos);
            contour_to_substract = save_contour_in_bw_image_in_slice_size(bone, contour);
            filled_contour = imfill(contour_to_substract,'holes');
                   
            [x,y] = find(filled_contour==1); % find coordinates of filled contour
            bone_coordinates = sprintf('bone%d',contours_counter); 
            struct_of_bones_coordinates.(bone_coordinates) = [x,y];
            bone = bone - filled_contour;
            contours_counter = contours_counter +1;
           
            
            end
        end
end

end





