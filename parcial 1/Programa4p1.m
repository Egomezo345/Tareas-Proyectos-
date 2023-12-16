pkg load database

% Establecer la conexión a la base de datos
conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Pesa123e'));

while true
    % Solicitar opción al usuario
    disp("Seleccione una opción: ");
    disp("1. Mostrar Lista de Pedidos");
    disp("2. Agregar Pedido");
    disp("3. Actualizar Pedido por Identificación");
    disp("4. Eliminar Pedido por Identificación");
    disp("5. Salir");

    opcion = input("");

    % Agregar un bloque try-catch para manejar posibles errores
    try
      switch opcion
          case 1
              % Mostrar lista de pedidos
              select_all_query = "SELECT * FROM pedido;";
              result = pq_exec_params(conn, select_all_query);

              disp("Lista de Pedidos:");
              disp(result.data);

          case 2
              % Agregar pedido
              cliente = input("Ingrese el nombre del cliente: ", 's');
              producto = input("Ingrese el nombre del producto: ", 's');
              entrega = input("¿Entregado? (si/no): ", 's');
              identificacion = input("Ingrese la identificación del pedido: ");

              % Crear y ejecutar la consulta de inserción
              insert_query = sprintf("INSERT INTO pedido (cliente, producto, entrega, identificacion) VALUES ('%s', '%s', '%s', '%d');", cliente, producto, entrega, identificacion);
              pq_exec_params(conn, insert_query);

              disp("Pedido agregado exitosamente.");

          case 3
              % Actualizar pedido por identificación
              identificacion = input("Ingrese la identificación del pedido a actualizar: ");

              % Verificar si el pedido existe
              select_query = sprintf("SELECT * FROM pedido WHERE identificacion = '%d';", identificacion);
              result = pq_exec_params(conn, select_query);

              if !isempty(result.data)
                  disp("Información actual del pedido:");
                  disp(result.data);

                  % Solicitar nueva información
                  entrega = input("¿Entregado? (Sí/No): ", 's');

                  % Crear y ejecutar la consulta de actualización
                  update_query = sprintf("UPDATE pedido SET entrega = '%s' WHERE identificacion = '%d';", entrega, identificacion);
                  pq_exec_params(conn, update_query);

                  disp("Pedido actualizado exitosamente.");
              else
                  disp("No se encontró un pedido con la identificación proporcionada.");
              end

          case 4
              % Eliminar pedido por identificación
              identificacion = input("Ingrese la identificación del pedido a eliminar: ");

              % Verificar si el pedido existe
              select_query = sprintf("SELECT * FROM pedido WHERE identificacion = '%d';", identificacion);
              result = pq_exec_params(conn, select_query);

              if !isempty(result.data)
                  % Crear y ejecutar la consulta de eliminación
                  delete_query = sprintf("DELETE FROM pedido WHERE identificacion = '%d';", identificacion);
                  pq_exec_params(conn, delete_query);

                  disp("Pedido eliminado exitosamente.");
              else
                  disp("No se encontró un pedido con la identificación proporcionada.");
              end

          case 5
              % Salir del programa
              pq_close(conn);
              disp("¡Hasta luego!");
              return;

          otherwise
              disp("Opción no válida. Por favor, seleccione una opción válida.");
      end
    catch
      disp("Ha ocurrido un error inesperado: ");
      disp(lasterr); % Mostrar el mensaje de error
    end_try_catch


end

