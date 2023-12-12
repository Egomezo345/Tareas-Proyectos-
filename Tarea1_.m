#Transformada de Fourier en Tiempo Discretro

#Parámetros de la señal
fs = 1000; #Frecuencia de muestreo en Hz
t = 0:1/fs:1; #Vector de tiempo
f = 100;
x = sin(2*pi*f*t);
%aplicar transformda de fourier
xf = fft(x);
%generar filtro pasabajos
n = length(x);
fcutoff = 50; % definimos la frecuencia de corte
h = ones(n, 1); % vector de ceros
h(round(n*fcutoff/fs)+1:end) = 0; %splicamos filtro pasabajo
% aplicar filtro a la señal en el dominio de la frecuencia
x_filtered = xf .* h;
% convertir la señal filtrada al dominio del tiempo
x_filtered = ifft(x_filtered);
% graficamos la señal original y la señal filtrada
figure;
subplot(2, 1, 1);
plot(t, x);
title('Señal original');
xlabel('Tiempo(s)');
ylabel('Amplitud');

subplot(2, 1, 2);
plot(t, real(x_filtered));
title('Señal filtrada');
xlabel('Tiempos (s)');
ylabel('Amplitud');
