function plot_movie_layer(dicom_cube,layer,p,q,r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for ii=1:r,
subplot(121);imagesc(dicom_cube(:,:,ii));colormap gray
subplot(122);imshow(layer(:,(ii-1)*p+1:ii*p))
pause
end


end

