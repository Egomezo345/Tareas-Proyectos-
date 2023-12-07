import numpy as np
import matplotlib.pyplot as plt

# Definimos la función
t = np.linspace(-0.04, 0.04, 1000)
x = 20 * np.exp(1j * (80 * np.pi * t - 0.4 * np

                       .pi))

# Graficamos la función en 3D
fig = plt.figure()
ax = fig.add_subplot(2, 2, 1, projection='3d')
ax.plot(t, np.real(x), np.imag(x))
ax.set_title('20*e^{j*(80\pit-0.4\pi)}')
ax.set_xlabel('Tiempo, s')
ax.set_ylabel('Real')
ax.set_zlabel('Imag')

# Graficamos la parte real e imaginaria de la función
fig = plt.figure()
ax1 = fig.add_subplot(2, 1, 1)
ax1.plot(t, np.real(x), 'b')
ax1.plot(t, np.imag(x), 'r')
ax1.set_title('Rojo - Componente Imaginario, Azul Componente Real de la Expnencial')
ax1.set_xlabel('Tiempo')
ax1.set_ylabel('Amplitud')

plt.show()
