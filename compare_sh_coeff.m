function compare_sh_coeff(bhat1, bhat2)

r_pearson =corr(bhat1,bhat2);
sprintf('Wspó?czynnik korelacji pomi?dzy sygna?ami bhat1 i bhat2 wynosi %d', r_pearson)

%http://en.wikipedia.org/wiki/Mahalanobis_distance

rsq1 = build_regression_model(bhat1,4);
rsq2 = build_regression_model(bhat2,4);
sprintf('Wspolczynnik regresji R^2 dla sh_coeff dla 1. stopy %d oraz  sh_coeff dla 2. stopy %d', rsq1, rsq2)


end
