function [bones3d,p,q,r] = multithresholding_for_3d(dicom_cube, class_num)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[p,q,r] = size(dicom_cube);


data3d = dicom_cube(:);
data3d = reshape(data3d, p,q*r);
thresh = multithresh(data3d, class_num);
segmented_image = imquantize(data3d, thresh);
bones3d = segmented_image == class_num +1;        % magic numbers: 5 - segmented class describing bone layer;)



end

