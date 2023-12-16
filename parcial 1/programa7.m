pkg load database

function conn = conectar_bd()
    conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port', '5432', 'user', 'postgres', 'password', 'Pesa123e'));
end

% Programa principal
conn = conectar_bd();

while true
    fprintf('Menú:\n');
    fprintf('1. Ingresar información de la película\n');
    fprintf('2. Recomendar películas por género\n');
    fprintf('3. Salir\n');

    opcion = input('Seleccione una opción: ');

    switch opcion
        case 1
            nombre = input('Ingrese el nombre de la película: ', 's');
            genero = input('Ingrese el género de la película: ', 's');
            actores = input('Ingrese actores de la película: ', 's');

    % Insertar datos en la base de datos
            query = sprintf("INSERT INTO recomendacion (nombre, genero, actores) VALUES ('%s', '%s', '%s');", nombre, genero, actores);
            pq_exec_params(conn, query);
        case 2
             genero = input('Ingrese el género para recibir recomendaciones: ', 's');

            % Consultar películas del mismo género en la base de datos
             query = sprintf("SELECT nombre FROM recomendacion WHERE genero = '%s';", genero);
             result = pq_exec_params(conn, query);

             if isempty(result.data)
                  disp('No hay películas en ese género en la base de datos.');
             else
                  disp('Peliculas recomendadas:');
                  disp(result.data);
             end
        case 3
            pq_close(conn);
            disp('¡Hasta luego!');
            return;
        otherwise
            disp('Opción no válida. Por favor, seleccione una opción válida.');
    end
end

