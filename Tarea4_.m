t = -0.04:0.001:0.04;
x = 20*exp(j*(80*pi*t-0.4*pi)); %definimos la funcion
subplot(2,2,1); % con esto logramos que se muestre las dos figuras en la misma imagen
plot3(t, real(x), imag(x)); grid %funcion para graficar la ecuacion que se definio
title('20*e^{j*(80\pit-0.4\pi)}') % con esto le agregamos el titulo a la grafica
xlabel('Tiempo, s'); ylabel('Real'); zlabel('Imag');
subplot(2,2,2); % con esto logramos que se muestre las dos figuras en la misma imagen
plot(t, real(x), 'b'); hold % funcion para graficar la parte real de la funcion
plot(t, imag(x), 'r'); grid %funcion para graficar la parte imaginaria de la funcion
title('Rojo - Componente Imaginario, Azul Componente Real de la Expnencial') %con esto le agregamos titulo a la grafica
xlabel('Tiempo'); ylabel('Amplitud');

