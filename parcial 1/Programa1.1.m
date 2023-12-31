function gestion_estudiantes()

  % Establecer la conexión a la base de datos
  conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Pesa123e'));

  % Agregar try catch
  try

    while true
      % Mostrar menú
      disp("1. Agregar estudiante");
      disp("2. Editar información de estudiante");
      disp("3. Eliminar estudiante");
      disp("4. Ver lista de estudiantes");
      disp("5. Salir");

      % Solicitar opción al usuario
      opcion = input("Seleccione una opción: ");

      switch opcion
        case 1
          % Agregar estudiante
          identificador = input("Ingrese la identificación del estudiante: ");
          nombre = input("Ingrese el nombre del estudiante: ");
          edad = input("Ingrese la edad del estudiante: ");
          genero = input("Ingrese el género del estudiante: ");
          direccion = input("Ingrese la dirección del estudiante: ");

          % Crear y ejecutar la consulta de inserción
          insert_query = sprintf("INSERT INTO estudiantes (identificador, nombre, edad, genero, direccion) VALUES ('%d', '%s', %d, '%s', '%s');", identificador, nombre, edad, genero, direccion);
          pq_exec_params(conn, insert_query);

          disp("Estudiante agregado exitosamente.");

        case 2
          % Editar información de estudiante
          identificador = input("Ingrese la identificación del estudiante a editar: ");

          % Verificar si el estudiante existe
          select_query = sprintf("SELECT * FROM estudiantes WHERE identificador = '%s';", identificador);
          result = pq_exec_params(conn, select_query);

          if ~isempty(result.data)
            % Solicitar nueva información
            nombre = input("Ingrese el nuevo nombre del estudiante: ");
            edad = input("Ingrese la nueva edad del estudiante: ");
            genero = input("Ingrese el nuevo género del estudiante: ");
            direccion = input("Ingrese la nueva dirección del estudiante: ");

            % Crear y ejecutar la consulta de actualización
            update_query = sprintf("UPDATE estudiantes SET nombre = '%s', edad = %d, genero = '%s', direccion = '%s' WHERE identificador = '%s';", nombre, edad, genero, direccion, identificador);
            pq_exec_params(conn, update_query);

            disp("Información del estudiante actualizada exitosamente.");
          else
            disp("El estudiante no existe en la base de datos.");
          end

        case 3
          % Eliminar estudiante
          identificador = input("Ingrese la identificación del estudiante a eliminar: ");

          % Verificar si el estudiante existe
          select_query = sprintf("SELECT * FROM estudiantes WHERE identificador = '%s';", identificador);
          result = pq_exec_params(conn, select_query);

          if ~isempty(result.data)
            % Crear y ejecutar la consulta de eliminación
            delete_query = sprintf("DELETE FROM estudiantes WHERE identificador = '%s';", identificador);
            pq_exec_params(conn, delete_query);

            disp("Estudiante eliminado exitosamente.");
          else
            disp("El estudiante no existe en la base de datos.");
          end

        case 4
          % Ver lista de estudiantes
          select_all_query = "SELECT * FROM estudiantes;";
          result = pq_exec_params(conn, select_all_query);

          disp("Lista de estudiantes:");
          disp(result.data);

        case 5
          % Salir del programa
          pq_close(conn);
          disp("¡Hasta luego!");
          return;

        otherwise
          disp("Opción no válida. Por favor, seleccione una opción válida.");
      end
    end

  catch e
    % Imprime el mensaje de error
    disp('Error: %s\n', e.message);
  end

