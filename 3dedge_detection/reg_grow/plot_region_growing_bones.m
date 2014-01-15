function plot_region_growing_bones(struct_of_bones_coordinates, bone_image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

figure, imshow(bone_image)
field_names = fieldnames(struct_of_bones_coordinates);
structSize = length(field_names);

for i=1:structSize
    
poly = struct_of_bones_coordinates.(char(field_names(i)));
hold all;
plot(poly(:,2), poly(:,1), 'LineWidth', 2);

end

figure, imshow(bone_image)

end

