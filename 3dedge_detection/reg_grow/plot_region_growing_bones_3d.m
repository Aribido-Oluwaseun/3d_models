function plot_region_growing_bones_3d(struct_of_bones_coordinates_3d, bones_cube,subsampling, number_of_bone)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

field_names = fieldnames(struct_of_bones_coordinates_3d);

if ~exist('number_of_bone', 'var') || isempty(number_of_bone)
    structSize = length(field_names);
else 
    structSize = number_of_bone;
end


for i=1:structSize
    
poly = struct_of_bones_coordinates_3d.(char(field_names(i)));
hold all;

x = poly(:,1);
y = poly(:,2);
z = poly(:,3);

plot3(x(1:subsampling:end),y(1:subsampling:end),z(1:subsampling:end), '.');

end


end

