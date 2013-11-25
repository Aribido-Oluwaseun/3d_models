function plot_sh_coeff(bhat1, bhat2)


figure('name','SH coeff. for left and right foot')
subplot(1,3,1); title('bhat- foot1'); plot(bhat1)
subplot(1,3,2); title('bhat- foot2'); plot(bhat2)
subplot(1,3,3); title('bhat_foot1 - bhat_foot2'); plot(abs(bhat1-bhat2))


end