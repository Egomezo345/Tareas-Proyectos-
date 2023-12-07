import numpy as np
import matplotlib.pyplot as plt

# Definimos la función
n = np.linspace(-1000, 1000, 2001)
x = np.exp(1j * 2 * np.pi * 0.01 * n)
y = np.exp(1j * 2 * np.pi * 2.01 * n)

# Graficamos la función `x`
fig = plt.figure()
ax1 = fig.add_subplot(2, 1, 1)
ax1.plot(n, np.real(x))
ax1.set_title('Parte real de la función x')
ax1.set_xlabel('n')
ax1.set_ylabel('Amplitud')

# Graficamos la función `y`
ax2 = fig.add_subplot(2, 1, 2)
ax2.plot(n, np.real(y), 'r')
ax2.set_title('Parte real de la función y')
ax2.set_xlabel('n')
ax2.set_ylabel('Amplitud')

plt.show()
