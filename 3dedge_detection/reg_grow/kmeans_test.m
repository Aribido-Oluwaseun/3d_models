function kmeans_test(bones_xyz)
 close all

[numInst,numDims] = size(bones_xyz);
number_of_classes = 6;

%# K-means clustering
%# (K: number of clusters, G: assigned groups, C: cluster centers)

[g,c] = kmeans(bones_xyz, number_of_classes, 'distance','sqEuclidean', 'start','sample');

y = bones_xyz(:,1);
x = bones_xyz(:,2);
z = bones_xyz(:,3);
xn = x(g==1);
yn = y(g==1);
zn = z(g==1);

plot3(xn(1:1:end),yn(1:1:end),zn(1:1:end),'r.')
xn2 = x(g==2);
yn2 = y(g==2);
zn2 = z(g==2);
hold on
plot3(xn2(1:1:end),yn2(1:1:end),zn2(1:1:end),'b.')

end