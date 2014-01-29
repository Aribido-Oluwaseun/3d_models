function  plot_bones(bones_coordinates, subsampling)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

x= bones_coordinates(:,1);
y= bones_coordinates(:,2);
z= bones_coordinates(:,3);

plot3(y(1:subsampling:end),x(1:subsampling:end),z(1:subsampling:end), ...
    '.', 'Color', rand(1,3));
end

