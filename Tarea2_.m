% Pedir al usuario que ingrese un número
n = input('Ingresa un número entero positivo: ');

try
    % Calcular el factorial usando la función calcularFactorial
    if n < 0
        error('El factorial no está definido para números negativos.');
    elseif n == 0 || n == 1 % con esta condicion se detecta si numero ingresado es uno o cero
        factorial = 1;
    else % con esta condicion hace que calcule el factorial si el numero es diferente a uno
        factorial = 1; % con esta funcion inicializa la variable factorial
        for i = 2:n
            factorial = factorial * i;
        end
    end
    % Mostrar el resultado
    fprintf('El factorial de %d es %d\n', n, factorial); % nos muestra el resultado y da un salto de linea
catch e
    % Manejar el error si el usuario ingresa un número negativo o no entero
    fprintf('Error: %s\n', e.message);
end
