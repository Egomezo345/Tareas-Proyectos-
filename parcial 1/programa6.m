pkg load database

function conn = conectar_bd()
    conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Pesa123e'));
end

function ingresar_sensor(conn)
    nombre = input('Ingrese el nombre del sensor: ', 's');
    marca = input('Ingrese la marca del sensor: ', 's');
    anio = input('Ingrese el año del sensor: ');

    % Insertar datos en la base de datos
    query = sprintf("INSERT INTO sensores (nombre, marca, anio) VALUES ('%s', '%s', %d);", nombre, marca, anio);
    pq_exec_params(conn, query);
end

% Programa principal
conn = conectar_bd();

while true
    fprintf('Menú:\n');
    fprintf('1. Ingresar información del sensor\n');
    fprintf('2. Seleccionar un sensor para visualizar su información\n');
    fprintf('3. Mostrar gráficas de los datos ingresados\n');
    fprintf('4. Salir\n');

    opcion = input('Seleccione una opción: ');

    switch opcion
        case 1
            ingresar_sensor(conn);
        case 2
            nombre_sensor = input('Ingrese el nombre del sensor a visualizar: ', 's');

    % Consultar datos del sensor en la base de datos
            query = sprintf("SELECT * FROM sensores WHERE nombre = '%s';", nombre_sensor);
            result = pq_exec_params(conn, query);

             if isempty(result.data)
              disp('No se encontró información para el sensor especificado.');
                else
                  disp(result.data);
                end
        case 3
            % Consultar todos los datos de la tabla sensores6
              query = "SELECT * FROM sensores;";
              result = pq_exec_params(conn, query);

              if isempty(result.data)
                    disp('No hay datos para mostrar.');
              else
        % Extraer datos para graficar
                nombre_sensores = result.data(:, 1);
                anios_str = result.data(:, 3);

        % Convertir años a números
                anios = str2double(anios_str);

        % Verificar si la conversión fue exitosa
                  if any(isnan(anios))
                        disp('Error al convertir años a números.');
                          else
        % Graficar
                      figure;
                      bar(anios);
                      set(gca, 'XTickLabel', nombre_sensores, 'XTick', 1:numel(nombre_sensores));
                      xlabel('Sensores');
                      ylabel('Año');
                      title('Años de fabricación de sensores');
                      grid on;
                  end
              end
        case 4
            pq_close(conn);
            disp('¡Hasta luego!');
            return;
        otherwise
            disp('Opción no válida. Por favor, seleccione una opción válida.');
    end
end
