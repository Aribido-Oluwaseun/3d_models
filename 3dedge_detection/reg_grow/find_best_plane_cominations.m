function [ output_args ] = find_best_plane_combinations(bones_xyz, xthickness,ythickness, zthickness)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


x=bones_xyz(:,1);
x=x*xthickness;
y=bones_xyz(:,2);
y=y*ythickness;
z=bones_xyz(:,3);
z=z*zthickness;

xs=x(1:100:end);
ys=y(1:100:end);
zs=z(1:100:end);

xm=mean(xs);
ym=mean(ys);
zm=mean(zs);

vx = var(xs);
vy = var(ys);
vz = var(zs);


H = [xs ys zs xs.^2 ys.^2 xs.*ys xs.*zs ys.*zs ones(size(xs))];
p = H\(zs.^2);


end

% 
% H= [x1 y1 ones(size(x1))];
% w=exp(-((xs-xm).^2)/2)+exp(-((ys-ym).^2)/2)% +exp(-((zs-zm).^2)/2000);
% w=w'*w;
% 
% %p=(H'*w*H)^(-1)*H'*w*ys;
% p=H\z1;
% 

%%%%%%p=(H'*w*H)^(-1)*H'*w*x1;

% 
% 
% zhat=H*p;
% %plot3(xs,ys,zs,'r.')
% 
% plot3(x1, y1,z1,'b.')
% hold on
% plot3(zhat, y1, x1 ,'m.')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% %plot3(xs, ys,zs,'r.')
% 
% hold off
