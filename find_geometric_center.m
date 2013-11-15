function [xsr, ysr, zsr, x_i_ss, y_i_ss,z_i_ss] = find_geometric_center(g, x, y, z, num_of_group, ss)
%FIND_GEOMETRIC_CENTER finds the geometry center of the solid
% input: classes as kmeans product and number of class ( 1 or 2 for left
% and right foot) and ss - subsapling number 1 if not subsampled EXample:
% 100  or 1000
% output: coordinates of the geometric center and subsapled coorinates of bone/foot [x, y, z, x_ss,y_ss, z_ss]
   
%     x_i = NaN;
%     y_i = NaN;
%     z_i = NaN;

   ind = find(g == num_of_group);
     
   x_i = x(ind); 
   y_i = y(ind); 
   z_i = z(ind);
   
  
   
   x_i_ss = x_i(1:ss:end);
   y_i_ss = y_i(1:ss:end);
   z_i_ss = z_i(1:ss:end);
   
   
   xsr = sum(x_i_ss(:))/length(x_i_ss);
   ysr = sum(y_i_ss(:))/length(y_i_ss);
   zsr = sum(z_i_ss(:))/length(z_i_ss);
   
   

end

