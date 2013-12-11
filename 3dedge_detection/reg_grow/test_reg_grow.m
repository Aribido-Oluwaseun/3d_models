clear 
close all
 load example
  figure, imshow(cIM, [0 1500]), hold all
  poly = regionGrowing(cIM, [], 300); % click somewhere inside the lungs
  plot(poly(:,1), poly(:,2), 'LineWidth', 2)
  
%   load mri
%   poly = regionGrowing(squeeze(D), [66,55,13], 60, Inf, [], true, false);
%   plot3(poly(:,1), poly(:,2), poly(:,3), 'x', 'LineWidth', 2)


  
%   info = dicominfo('CT-MONO2-16-ankle.dcm');
%   Y = dicomread(info);
%   figure, imshow(Y), imcontrast, hold all
%   poly = regionGrowing(Y, [], 500); % click somewhere inside the lungs
%   plot(poly(:,1), poly(:,2), 'LineWidth', 2)