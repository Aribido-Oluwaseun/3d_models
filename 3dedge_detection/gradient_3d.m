


f=@(x,y) sin(x).*cos(2*y); % definicja jakiej? funkcji 
x=-3:0.1:3; 
[X,Y]=meshgrid(x); 
F=f(X,Y);

[gx,gy]=gradient(F); % Liczenie gradientu 
contour(X,Y,F)
hold on 
quiver(X,Y,gx,gy) % wy?wietlenie danych o gradiencie 