function plot_convn_of_sh_coef(bhat1,bhat2)
figure, title('sh coef. for right and left foot')
plot(convn(bhat1,bhat2))
end