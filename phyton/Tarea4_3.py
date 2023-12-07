import numpy as np
import matplotlib.pyplot as plt

# Definimos el rango de la gráfica
n = np.linspace(-50, 50, 101)

# Definimos las funciones
x = np.cos(np.pi * 0.1 * n)
y = np.cos(np.pi * 0.9 * n)
z = np.cos(np.pi * 2.1 * n)

# Graficamos las funciones
fig = plt.figure()
ax1 = fig.add_subplot(3, 1, 1)
ax1.plot(n, x)
ax1.set_title('x[n]=cos(0.1\pin)')
ax1.set_xlabel('n')
ax1.grid()

ax2 = fig.add_subplot(3, 1, 2)
ax2.plot(n, y)
ax2.set_title('y[n]=cos(0.9\pin)')
ax2.set_xlabel('n')
ax2.grid()

ax3 = fig.add_subplot(3, 1, 3)
ax3.plot(n, z)
ax3.set_title('z[n]=cos(2.1\pin)')
ax3.set_xlabel('n')
ax3.grid()

plt.show()
