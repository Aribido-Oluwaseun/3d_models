function [ contoured_wih_morphological_operation_image ] = morphological_contouring(image_to_contouring)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   contoured_wih_morphological_operation_image = bwmorph(image_to_contouring, 'remove');
   figure, imshow(contoured_wih_morphological_operation_image);
end

