function [x y z] = extract_coorinates_from_stl(fv)
%extract_coorinates_from_stl prepares stl file to further conversion, it
%extracts x, y , z coordinates

%   input: stl file with the solid
%   output: x, y , z coordinates 

x= fv.vertices(:,1);
y= fv.vertices(:,2);
z= fv.vertices(:,3);

end

