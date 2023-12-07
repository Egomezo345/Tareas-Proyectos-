import numpy as np
import matplotlib.pyplot as plt

# Definimos el rango de la gráfica
n = np.linspace(-3, 7, 11)

# Definimos las funciones
x = 0.55 ** (n + 3)
h = np.ones(11)
y = np.convolve(h, x)

# Graficamos las funciones
fig = plt.figure()
ax1 = fig.add_subplot(3, 1, 1)
ax1.stem(x)
ax1.set_title('señal original')

ax2 = fig.add_subplot(3, 1, 2)
ax2.stem(h)
ax2.set_title('Respuesta al impulso')

ax3 = fig.add_subplot(3, 1, 3)
ax3.stem(y)
ax3.set_title('convolucion resultante')

plt.show()
