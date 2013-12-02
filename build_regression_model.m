function rsq = build_regression_model(bhat, polynom_range)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


[m,n] = size(bhat);

x=(1:m)';
p = polyfit(x, bhat, polynom_range);
yfit = polyval(p,x);
yfit_values = 0;

for i=0:(length(p)-1)
    
    yfit_values = yfit_values + p(polynom_range - i + 1)* (x.^(i));

end

resid = bhat-yfit_values;
SSresid= sum(resid.^2);
SStotal = (length(bhat)-1) * var(bhat);
rsq = 1 - SSresid/SStotal;



end

