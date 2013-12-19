function [bones3d,p,q,r] = multithresholding_for_3d(dicom_cube)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[p,q,r] = size(dicom_cube);


data3d = dicom_cube(:);
data3d = reshape(data3d, p,q*r);
thresh = multithresh(data3d, 4);
segmented_image = imquantize(data3d, thresh);
bones3d = segmented_image == 5;        % magic numbers: 5 - segmented class describing bone layer;)



end

