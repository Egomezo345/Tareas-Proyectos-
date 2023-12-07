n=-3:7; %definimos un rango para la grafica
x=0.55.^(n+3); %definimos la funcion x
h=[1 1 1 1 1 1 1 1 1 1 1]; %definimos un arreglo
y=conv(h,x); %definimos la funcion z
subplot(311); %esto nos permite tener las tres graficas en la misma imagen
stem(x) %se usa para secuencias disecretas
title('señal original'); %titulo de la funcion
subplot(312); %esto nos permite tener las tres graficas en la misma imagen
stem(h) %se usa para secuencias disecretas
title('Respuesta al impulso') % titulo de la funcion y
subplot(313); %esto nos permite tener las tres graficas en la misma imagen
stem(y) %se usa para secuencias disecretas
title('convolucion resultante'); % titulo de la funcion y
