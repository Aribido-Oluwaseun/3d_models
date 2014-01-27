function calcaneus_comparison()
%--------------------------- data preprocessing
dicom_cube = gather_dicom_cube;
[bones3d,p,q,r] = multithresholding_for_3d(dicom_cube); %find bone in 3d
%plot_3d_thresholded(p,q,r, bones3d, 100);
bones_cube = save_bones3d_to_3d_matrix_as_bw(bones3d);
load segmented_bones
%plot_region_growing_bones_3d(struct_of_bones_coordinates_3d,10)
bones_xyz = matrix3d_to_xyz_coordinates(bones3d);

%------------------------------ calcaneus extraction
b11 = struct_of_bones_coordinates_3d.bone111; %calcaneus 1 part1
b12 = struct_of_bones_coordinates_3d.bone105; %calcaneus 1 part2
b2 = struct_of_bones_coordinates_3d.bone70; % calcaneus 2
b1 =[b11; b12];
%------------------------------ calcaneus plotting
subsampling = 1;
figure,
plot_bones(b11,subsampling);
hold on
plot_bones(b12,subsampling);
plot_bones(b2,subsampling);
hold off

figure,
plot_bones(b1,subsampling);
hold on
plot_bones(b2,10);
hold off

%---------------------  spherical harmonics
[xc1,yc1,zc1,x1,y1,z1] = find_centre_of_bone(b1);
[xc2,yc2,zc2,x2,y2,z2] = find_centre_of_bone(b2);
   
   
[x1n, norm_coeff_x1] = normalize(x1-xc1);
[y1n, norm_coeff_y1] = normalize(y1-yc1);   
[z1n, norm_coeff_z1] = normalize(z1-zc1);

[x2n, norm_coeff_x2] = normalize(x2-xc2);
[y2n, norm_coeff_y2] = normalize(y2-yc2);   
[z2n, norm_coeff_z2] = normalize(z2-zc2);


[bhat1, xhat1, yhat1, zhat1] = spherical_harmonics(x1n, y1n, z1n, 10);
[bhat2, xhat2, yhat2, zhat2] = spherical_harmonics(x2n, y2n, z2n, 10);'
 

% ----------------------- calcaneus comparison




%------------------------ functions used aboved

    function plot_bones(bones_coordinates, subsampling)
        %UNTITLED2 Summary of this function goes here
        %   Detailed explanation goes here

        x= bones_coordinates(:,1);
        y= bones_coordinates(:,2);
        z= bones_coordinates(:,3);

        plot3(x(1:subsampling:end),y(1:subsampling:end),z(1:subsampling:end), ...
            '.', 'Color', rand(1,3));
    end
    function [xc,yc,zc,x,y,z] = find_centre_of_bone(bone_coor)
    
x = bone_coor(:,1);
y = bone_coor(:,2);
z = bone_coor(:,3);
        
xc = sum(x(:))/length(x);
yc = sum(y(:))/length(y);
zc = sum(z(:))/length(z);
    
end
    function [normalized_var, norm_coeff] = normalize(var)
      norm_coeff = abs(max(var(:)));
      normalized_var = var/norm_coeff;
    end
    function [b_hat, x, y, z_hat] = spherical_harmonics(x, y, z, order)
        %SPHERICAL_HARMONICS Summary of this function goes here
        %   Detailed explanation goes here

           %Z=-Z-z0;    ????

        [th,phi,RR]=cart2sph(x,y,z);
        RRmax=max(RR);
        RR=RR/RRmax; %unit solid
        [x,y,z]=sph2cart(th,phi,RR);            



        SHBasis = construct_SH_basis(order,[x y z],1);
        warning off %#ok<WNOFF>
        %b_hat = SHBasis(:,1:(rank+1)*(rank/2+1))\z;
        b_hat = SHBasis\z;
        warning on %#ok<WNON>
             z_hat = SHBasis*b_hat;
             [th,phi,RR]=cart2sph(x,y,z_hat);
             [x,y,z_hat]=sph2cart(th,phi,RR*RRmax);  
end


end


