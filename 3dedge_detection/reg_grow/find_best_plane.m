function [ output_args ] = find_best_plane(bones_xyz)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


x=bones_xyz(:,1);
y=bones_xyz(:,2);
z=bones_xyz(:,3);
xs=x(1:100:end);
ys=y(1:100:end);
zs=z(1:100:end);
xm=mean(xs);
ym=mean(ys);
zm=mean(zs);
xsw = xs.*exp(-((xs-xm).^2)/2000);
ysw = ys.*exp(-((ys-ym).^2)/2000);
zsw = zs.*exp(-((zs-zm).^2)/2000);



x1=xs;
y1=zs;
z1=ys;



H= [xs ys ones(size(xs))];
w=exp(-((xs-xm).^2)/2000)+exp(-((ys-ym).^2)/2000) +exp(-((zs-zm).^2)/2000);
w=w'*w;

%p=(H'*w*H)^(-1)*H'*w*ys;
p=H\y1;



zhat=H*p;
%plot3(xs,ys,zs,'r.')

plot3(x1, y1,z1,'b.')
hold on
plot3(y1,x1,zhat,'m.')


hold off




end

