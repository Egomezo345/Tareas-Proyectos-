import math
def calcular_factorial():
    try:
        # Pedir al usuario que ingrese un número
        num = int(input('Ingrese un número para calcular su factorial: '))
        if num >= 0: # Verificar si el número es un entero no negativo
            R = math.factorial(num) # Calcula el factorial del número
            print(f'El factorial es {R}')
        else:
            print('No se puede calcular el factorial. Ingrese un entero no negativo.') # Muestra mensaje si el número no es un entero no negativo
    except ValueError:
        print('Error: Ingrese un número entero.') # Manejar el caso en el que el usuario ingresa algo que no es un número entero

# Llamar a la función
calcular_factorial()