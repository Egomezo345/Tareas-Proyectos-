# Importar bibliotecas
import numpy as np
import matplotlib.pyplot as plt
# Parámetros de la señal
fs = 1000  # Frecuencia de muestreo en Hz
t = np.arange(0, 1, 1 / fs)  # Vector de tiempo
f = 100
x = np.sin(2 * np.pi * f * t)
# Aplicar transformada de Fourier
xf = np.fft.fft(x)
# Generar filtro pasabajos
n = len(x)
fcutoff = 45  # Definimos la frecuencia de corte
h = np.ones(n, dtype=complex)  # Vector de ceros
h[int(n * fcutoff / fs) + 1:] = 0  # Aplicamos filtro pasabajos
# Aplicar filtro a la señal en el dominio de la frecuencia
x_filtered = xf * h
# Convertir la señal filtrada al dominio del tiempo
x_filtered = np.fft.ifft(x_filtered)

# Graficar la señal original y la señal filtrada
plt.figure()
plt.subplot(2, 1, 1)
plt.plot(t, x)
plt.title('Señal original')
plt.xlabel('Tiempo(s)')
plt.ylabel('Amplitud')

plt.subplot(2, 1, 2)
plt.plot(t, np.real(x_filtered))
plt.title('Señal filtrada')
plt.xlabel('Tiempos (s)')
plt.ylabel('Amplitud')

plt.show()

