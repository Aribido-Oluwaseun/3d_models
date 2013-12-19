 function struct_of_contours = region_growing(image, number_of_contours)
 figure,
for i=1:number_of_contours
field_name = sprintf('contour%d',i);    
poly = regionGrowing(image);
struct_of_contours.(field_name) = poly;
hold all;
plot(poly(:,1), poly(:,2), 'LineWidth', 2)
end


    end