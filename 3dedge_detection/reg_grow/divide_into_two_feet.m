function [G, C]= divide_into_two_feet(X,plotoption)

[numInst,numDims] = size(X);
number_of_classes = 2;

%# K-means clustering
%# (K: number of clusters, G: assigned groups, C: cluster centers)

[G,C] = kmeans(X, number_of_classes, 'distance','correlation', 'start','sample');

%# show points and clusters (color-coded)
clr = lines(number_of_classes);

if plotoption
figure, hold on

x = X(:,1);
y = X(:,2); 
z = X(:,3);


scatter3(x,y,z,36, clr(G,:), 'Marker','.')
scatter3(C(:,1), C(:,2), C(:,3), 100, clr, 'Marker','o', 'LineWidth',3)
hold off
view(3), axis vis3d, box on, rotate3d on
xlabel('x'), ylabel('y'), zlabel('z'), title('Bones of foot')

end


end






