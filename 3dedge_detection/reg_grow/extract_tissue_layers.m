function [struct_segmented_images, bone] = extract_tissue_layers(image, thresh)
for i=1:length(thresh)
field_name = sprintf('class%d',i);    
%tissue_layer = im2bw(image,thresh(i));
struct_segmented_images.(field_name) = image == i;
 if i==length(thresh)
    bone = image == (i+1); 
 end
end


end


