function adjusted_dicom_cube = dicom_imadjust(dicom_cube)
    [p,q,r] = size(dicom_cube);
    adjusted_dicom_cube = zeros(p,q,r);
    for i=1:r
        im = dicom_cube(:,:,i);
        im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));
        adjusted_dicom_cube(:,:,i) = im;
    end
end


% TO DOBRZE DZIALA, PETLA NIE????....
% dicom_cube = gather_dicom_cube; p3 justyna
% image = dicom_cube(:,:,130);
% image = imadjust(image/max(image(:)),[0 1],[0 1],2*(1-0.5));
% imshow(image)
% [thresh, segmented_image] = multithresholding(image,4);

% function adjusted_dicom_cube = dicom_imadjust(dicom_cube)
%     [p,q,r] = size(dicom_cube);
%     adjusted_dicom_cube = zeros(p,q,r);
%     for i=1:r
%         im = dicom_cube(:,:,r);
%         im = imadjust(im/max(im(:)),[0 1],[0 1],2*(1-0.5));%(1-get(slide,'Value')));
%         adjusted_dicom_cube(:,:,r) = im;
%     end
% end