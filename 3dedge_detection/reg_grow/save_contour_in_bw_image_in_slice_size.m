function out_image = save_contour_in_bw_image_in_slice_size(bone_image, contour)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m, n] = size(bone_image);
out_image = zeros(m,n);
x = contour(:,1);
y = contour(:,2);

for i=1:length(x)
   out_image(y(i),x(i))= 1;
end

