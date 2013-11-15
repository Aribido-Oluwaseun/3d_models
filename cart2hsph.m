function [az,elev,r] = cart2hsph(x,y,z)
%
%
%
r = sqrt(x.^2+y.^2+z.^2);
elev = abs(atan2(z,sqrt(x.^2+y.^2)));
az = atan2(y,x);
