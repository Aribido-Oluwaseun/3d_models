function [image] = choose_dicom_image(dicom_cube, plane, slice_num)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    if plane == 'axial'
        image = dicom_cube(:,:,slice_num);
    elseif plane == 'sagittal'
        image = dicom_cube(:,slice_num,:);
    else plane == 'coronal'
    
        image = dicom_cube(slice_num,:,:);
    end
    
    %image = double(squeeze(threedarray(axvert,axhorz,z)));
    image = imadjust(image/max(image(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
    %figure, imshow(image);
 

end

