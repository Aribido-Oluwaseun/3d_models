function [ out_image ] = save_contour_in_bw_image_in_size_of_input_data(bones_cube, contour3d)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[m, n, o] = size(bones_cube);
out_image = zeros(m,n,o);
x = contour3d(:,1);
y = contour3d(:,2);
z = contour3d(:,3);

% zapisywanie conturu w macierzy rozmiaru bones_cube


end

