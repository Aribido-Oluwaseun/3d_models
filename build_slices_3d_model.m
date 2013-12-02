function build_slices_3d_model(struct_of_xyz_coordinates)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

   xx=[];yy=[];zz=[];
   [X,Y]=meshgrid(1:512,1:512);
   
   for ii=1:250,
       ind = model(:,:,ii)== 1;
       xx = [xx;X(ind)];
       yy = [yy;Y(ind)];
       zz = [zz;ii*ones(length(X(ind)),1)];
   end
end

