n=-50:50; %definimos un rango para la grafica
x=cos(pi*0.1*n); %definimos la funcion x
y=cos(pi*0.9*n); %definimos la funcion y
z=cos(pi*2.1*n); %definimos la funcion z
subplot(311); %esto nos permite tener las tres graficas en la misma imagen
plot(n,x); %graficamos la funcion x
title('x[n]=cos(0.1\pin)') % titulo de la funcion x
grid
subplot(312); %esto nos permite tener las tres graficas en la misma imagen
plot(n,y); %graficamos la funcion y
title('y[n]=cos(0.9\pin)') % titulo de la funcion y
grid
subplot(313); %esto nos permite tener las tres graficas en la misma imagen
plot(n,z); %graficamos la funcion z
grid
title('z[n]=cos(2.1\pin)') %titulo de la funcion z
xlabel('n')
