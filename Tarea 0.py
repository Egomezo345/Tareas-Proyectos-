import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0, 2*np.pi, 0.01) # Crear un vector x de 0 a 2*pi con incrementos de 0.01

y = np.sin(x) # Calcula el seno de cada valor en el vector x

# Graficar la función
plt.plot(x, y)
plt.title('Gráfica de y = sin(x)')
plt.xlabel('x')
plt.ylabel('y')
plt.show()