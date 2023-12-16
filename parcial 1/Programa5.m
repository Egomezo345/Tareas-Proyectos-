% Este programa permite monitorear las ventas de una empresa
function monitoreo_ventas()

  % Establecer la conexión a la base de datos
  conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Pesa123e'));

  % Agregar el try catch
  try
    while true
      fprintf('\n Ventas \n');
      fprintf('1. Generar Informe de Ventas\n');
      fprintf('2. Agregar Venta\n');
      fprintf('3. Analizar Datos de Ventas\n');
      fprintf('4. Salir\n');

      eleccion = input('Ingrese la opción deseada: ');

      switch eleccion
        case 1
          % Generar un informe de ventas
          select_all_query = "SELECT * FROM ventas;";
          result = pq_exec_params(conn, select_all_query);

              disp("Lista de Pedidos:");
              disp(result.data);

        case 2
          % Agregar venta
          dia = input('Escriba el día de la venta en formato año-mes-día: ', 's');
          articulo = input('Ingrese el nombre del artículo: ', 's');
          cantidad = input('Ingrese la cantidad vendida: ');
          ingresos = input('Ingrese los ingresos generados: ');

          % Insertar datos de venta en la base de datos
          insert_query = "INSERT INTO ventas (fecha, producto, cantidad, ingresos) VALUES ($1, $2, $3, $4)";

          pq_exec_params(conn, insert_query, {dia, articulo, cantidad, ingresos});
          fprintf('Se ha registrado la venta correctamente.\n');

        case 3
          % Ejecutar una consulta SQL para obtener los datos de la columna deseada
          sql = "SELECT producto FROM ventas";
          res = pq_exec_params(conn, sql);
          data = cell2mat(cell(res.data));

          % Cerrar la conexión
          pq_finish(conn);

% Contar la frecuencia de cada valor único en la columna
          [unique_data, ~, idx] = unique(data);
          freq = accumarray(idx, 1);

% Encontrar el valor que se repite más
          [max_freq, max_idx] = max(freq);
           most_repeated = unique_data(max_idx);

% Mostrar el resultado
          printf("El valor que se repite más en la columna es %d, con una frecuencia de %d\n", most_repeated, max_freq);

        case 4
          % Cerrar la conexión a la base de datos y salir
          pq_close(conn);
          fprintf('¡Hasta luego!\n');
          return;

        otherwise
          fprintf('Opción no válida. Por favor, elija una opción válida.\n');
      end
    end
  catch e
    % Imprime el mensaje de error
    fprintf('Error: %s\n', e.message);
  end

end

