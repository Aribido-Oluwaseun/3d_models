function plot_3d_layer(p,q,r, layer)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x=1:p;
y=1:q;
z=1:r;
[X,Y,Z]=meshgrid(x,y,z);
X=X(layer);
Y=Y(layer);
Z=Z(layer);
figure, plot3(X,Y,Z,'r.');


end

