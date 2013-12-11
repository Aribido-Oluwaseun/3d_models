function [ poly, image ] = find_bones_by_region_growing(image, seed)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    figure, imshow(image), hold all 
    image = uint16(image);
   % imcontrast;
    poly = regionGrowing(image, [], seed); % click somewhere inside the lungs
    plot(poly(:,1), poly(:,2), 'LineWidth', 2)

end

