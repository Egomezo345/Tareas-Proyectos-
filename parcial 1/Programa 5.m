function monitoreo_ventas()
    % Establecer la conexión a la base de datos
    conn = pq_connect(setdbopts('dbname', '1erparcial', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Electronica'));

    while true
        fprintf('\n--- Monitoreo de Ventas ---\n');
        fprintf('1. Agregar Venta\n');
        fprintf('2. Generar Informe de Ventas\n');
        fprintf('3. Analizar Datos de Ventas\n');
        fprintf('4. Salir\n');

        opcion = input('Selecciona una opción: ');

        switch opcion
            case 1
                fecha = input('Ingrese la fecha de la venta (YYYY-MM-DD): ', 's');
                producto = input('Ingrese el nombre del producto: ', 's');
                cantidad = input('Ingrese la cantidad vendida: ');
                ingresos = input('Ingrese los ingresos generados: ');

                % Insertar datos de venta en la base de datos
                insert_query = "INSERT INTO ventas (fecha, producto, cantidad, ingresos) VALUES ($1, $2, $3, $4)";
                pq_exec_params(conn, insert_query, {fecha, producto, cantidad, ingresos});
                fprintf('Datos de venta agregados con éxito.\n');

            case 2
                % Generar un informe de ventas
                select_query = "SELECT fecha, producto, cantidad, ingresos FROM ventas";
                result = pq_prepare(conn, 'select_query', select_query, 0, {});
                pq_send_query_prepared(conn, 'select_query', 0, {});
                pq_wait(conn);

                fprintf('\nInforme de Ventas:\n');
                fprintf('Fecha       Producto    Cantidad    Ingresos\n');

                while true
                    res = pq_get_result(conn);
                    if isempty(res)
                        break;
                    end
                    data = pq_fetch(res);
                    fprintf('%s   %s   %s   %s\n', data{1}, data{2}, data{3}, data{4});
                end

            case 3
                % Analizar los datos de ventas (aquí puedes agregar tu propio código de análisis)
                fprintf('Análisis de datos de ventas (¡Agrega tu propio código aquí!)\n');

            case 4
                % Cerrar la conexión a la base de datos y salir
                pq_close(conn);
                fprintf('¡Hasta luego!\n');
                return;

            otherwise
                fprintf('Opción no válida. Por favor, elija una opción válida.\n');
        end
    end
end

% Llamada a la función principal
monitoreo_ventas();

