function [x,y,z] = extract_faces_from_stl(fv)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x= fv.faces(:,1);
y= fv.faces(:,2);
z= fv.faces(:,3);


end
