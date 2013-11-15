function [b_hat, x, y, z_hat] = spherical_harmonics( x, y, z, order)
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
     

