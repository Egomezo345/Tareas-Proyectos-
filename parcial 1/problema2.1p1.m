pkg load database
% Conexión a la base de datos
conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Pesa123e'));

% Menú interactivo
historial = struct('descripcion', {}, 'monto', {}, 'fecha', {});
while true
  disp("Menu:");
  disp("1. Ingresar nuevo gasto");
  disp("2. Resumen de gastos acumulados");
  disp("3. Ajustar presupuesto");
  disp("0. Salir");

  opcion = input("Ingrese el número de la opción deseada: ");

  switch opcion
    case 1
        descripcion = input("Ingrese la descripción del gasto: ", 's');
        monto = input("Ingrese el monto del gasto: ");
        fecha = input("Ingrese la fecha (YYYY-MM-DD): ", 's');
        nuevoGasto.descripcion = descripcion;
        nuevoGasto.monto = monto;
        nuevoGasto.fecha = fecha;
        historial(end + 1) = nuevoGasto;

        % Agregar un bloque try-catch para manejar posibles errores al insertar datos
        try
          insert_query = sprintf("INSERT INTO gastos (descripcion, monto, fecha) VALUES ('%s', %f, '%s')", descripcion, monto, fecha);
          pq_exec_params(conn, insert_query);
          disp("Gasto ingresado exitosamente.");
        catch
          disp("Error al insertar datos: ");
          disp(lasterr); % Mostrar el mensaje de error
        end_try_catch
    case 2
      if isempty(historial)
                   fprintf('No hay gastos en el historial.\n');
              else
                   fprintf('Resumen de gastos acumulados:\n');
                      for i = 1:length(historial)
                          fprintf('%s - Q%.2f - %s\n', historial(i).descripcion,
                           historial(i).monto, historial(i).fecha);
                      end
                  end
    case 3
      % Agregar lógica para ajustar presupuestos según necesidades
      presupuesto = input("Ingrese el presupuesto mensual: "); % Solicitar el presupuesto al usuario
      total = sum([historial.monto]); % Calcular el total de gastos
      if total > presupuesto
        disp("Ha superado el presupuesto. Debe reducir sus gastos en: ");
        disp(total - presupuesto); % Mostrar la diferencia
      elseif total < presupuesto
        disp("Aún tiene margen para gastar. Puede gastar hasta: ");
        disp(presupuesto - total); % Mostrar la diferencia
      else
        disp("Ha gastado exactamente el presupuesto. No puede gastar más.");
      end
    case 0
      disp("Saliendo del programa. ¡Hasta luego!");
      break;
    otherwise
      disp("Opción no válida. Por favor, elija una opción válida.");
  end
end

% Cierra la conexión a la base de datos al final
close(conn);

