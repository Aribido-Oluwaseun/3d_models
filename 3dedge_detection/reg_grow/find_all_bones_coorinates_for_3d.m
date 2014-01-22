function [ struct_of_bones_coordinates ] = find_all_bones_coorinates_for_3d(bones_cube)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


[m, n, o] = size(bones_cube);
init_pos = [];
contours_counter = 1;

for i=1:m
        for j=1:n
                for k=1:o
                    
                if bones_cube(i,j,k) == 1
                init_pos = [i,j,k];

              
               %[contour3d_coordinates, contour3d_mask] = regionGrowing(bones_cube, init_pos);
                 
               [contour3d_coordinates, contour3d_mask] = regionGrowing(bones_cube, init_pos, [], Inf, [], true, false);
                %filled_contour3d_mask = imfill(contour3d_mask,'holes');
              filled_contour3d_mask = contour3d_mask;
               % figure, plot_contour3d(contour3d)
               
               
                [x,y,z] = ind2sub(size(filled_contour3d_mask), find(filled_contour3d_mask)); % find coordinates of filled contour
                
                bone_coordinates = sprintf('bone%d',contours_counter); 
                struct_of_bones_coordinates.(bone_coordinates) = [x,y,z];
                
                bones_cube = bones_cube - filled_contour3d_mask;
                contours_counter = contours_counter +1;
                end
                
            end
          end
        end
        
        
end




