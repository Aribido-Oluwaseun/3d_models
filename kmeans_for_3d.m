function [G, C]= kmeans_for_3d(X, number_of_classes, plotoption)

[numInst,numDims] = size(X);

%# K-means clustering
%# (K: number of clusters, G: assigned groups, C: cluster centers)

[G,C] = kmeans(X, number_of_classes, 'distance','sqEuclidean', 'start','sample');

%# show points and clusters (color-coded)
clr = lines(number_of_classes);
if plotoption
figure, hold on
scatter3(X(:,1), X(:,2), X(:,3), 36, clr(G,:), 'Marker','.')
scatter3(C(:,1), C(:,2), C(:,3), 100, clr, 'Marker','o', 'LineWidth',3)
hold off
view(3), axis vis3d, box on, rotate3d on
xlabel('x'), ylabel('y'), zlabel('z'), title('Bones of foot')
end

end