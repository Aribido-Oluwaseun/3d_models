function [segemented_image,rgb, gray_segmented_image ] = multithresholding(image, level_num)

thresh = multithresh(image,level_num)
segemented_image = imquantize(image, thresh);
rgb = label2rgb(segemented_image);
gray_segmented_image = rgb2gray(rgb);
%figure, imshowpair(image,segemented_image,'montage')
figure, imshowpair(image, rgb,'montage')



end