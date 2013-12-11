load temp
load SphereMesh
Options=struct;
Options.Verbose=1;
Options.Wedge=0;
Options.Wline=-1;
Options.Alpha=0.2;
Options.Beta=0.2;
Options.Kappa=0.5;
Options.Delta=0.1000;
Options.Gamma=0.1000;
Options.Iterations=20;
Options.Sigma1=2;
Options.Sigma2=2;
Options.Lambda=0.8;
fv.vertices(:,1)=fv.vertices(:,1)+35;
fv.vertices(:,2)=fv.vertices(:,2)+25;
fv.vertices(:,3)=fv.vertices(:,3)+20;
OV=Snake3D(I,fv,Options)