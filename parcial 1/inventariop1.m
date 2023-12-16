pkg load database
function conn = conectar_bd()
 conn = pq_connect(setdbopts('dbname', 'postgres', 'host', 'localhost', 'port','5432', 'user', 'postgres', 'password', 'Pesa123e'));
end
function agregar_producto(conn, nombre, identificacion, cantidad, precio)
  query = sprintf("INSERT INTO inventario1 (nombre, identificacion, cantidad, precio) VALUES ('%s', '%s', %d, %f);", nombre, identificacion, cantidad, precio);
  pq_exec_params(conn, query);
end
function actualizar_producto(conn, identificacion, cantidad, precio)
  query = sprintf("UPDATE inventario1 SET cantidad = %d, precio = %f WHERE identificacion = '%s';", cantidad, precio, identificacion);
  pq_exec_params(conn, query);
end
function eliminar_producto(conn, identificacion)
    query = sprintf("DELETE FROM inventario1 WHERE identificacion = '%s';",identificacion);
    pq_exec_params(conn, query);
end
function gestion_inventario()
    conn = conectar_bd();
 while true
          fprintf('Bienvenido al Programa de Gestión de Inventario\n');
          fprintf('1. nuevo producto\n');
          fprintf('2. Actualizacio de producto\n');
          fprintf('3. Eliminar producto\n');
          fprintf('4. Salir\n');
          opcion = input('Seleccione una opción: ');
 try
        switch opcion
                case 1
                    nombre = input('Ingrese el nombre del producto: ', 's');
                    identificacion = input('Ingrese la identificación del producto: ', 's');
                    cantidad = input('Ingrese la cantidad del producto: ');
                    precio = input('Ingrese el precio del producto: ');
                    agregar_producto(conn, nombre, identificacion, cantidad, precio);
                    fprintf('Producto agregado exitosamente.\n');
                case 2
                    identificacion = input('Ingrese la identificación del producto a actualizar: ', 's');
                    cantidad = input('Ingrese la nueva cantidad del producto: ');
                    precio = input('Ingrese el nuevo precio del producto: ');
                    actualizar_producto(conn, identificacion, cantidad, precio);
                    fprintf('Información del producto actualizada exitosamente.\n');
                case 3
                    identificacion = input('Ingrese la identificación del producto a eliminar:', 's');
                    eliminar_producto(conn, identificacion);
                    fprintf('Producto eliminado exitosamente.\n');
                case 4
                    pq_close(conn);
                    fprintf('¡Hasta luego!\n');
                return;
                otherwise
                     fprintf('Opción no válida. Por favor, seleccione una opción válida.\n');
                end
 catch
 fprintf('Ha ocurrido un error inesperado. Por favor, inténtalo nuevamente.\n');
          end
      end
end
gestion_inventario();
