function bones_xyz = matrix3d_to_xyz_coordinates(bones3d)
%UNTITLED3 Summary of this function goes here
%   bones3d - outpout of multithreshold_for_3d 
%   



[p,q]=size(bones3d);

r=q/p;

x=1:p;
y=1:p;
z=1:r;

[X,Y,Z]=meshgrid(x,y,z);

X=X(bones3d);
Y=Y(bones3d);
Z=Z(bones3d);

bones_xyz = [X,Y,Z];

end

