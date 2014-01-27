function [xc,yc,zc,x,y,z] = find_centre_of_bone(bone_coor)
    
x = bone_coor(:,1);
y = bone_coor(:,2);
z = bone_coor(:,3);
        
xc = sum(x(:))/length(x);
yc = sum(y(:))/length(y);
zc = sum(z(:))/length(z);
    
end