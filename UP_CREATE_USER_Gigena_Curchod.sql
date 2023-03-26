USE universidad_privada;

/* Creamios el usuario administrativo_basico, quien es la primera linea de atencion de nuestros alumnos. Dicho usuario debera poder acceder a la informacion
sin tener posibilidad de alterarla ni nada por el estilo. Lo que lograremos a traves de los permisos otorgados en la linea siguiente a la creacion*/
CREATE USER administrativo_basico@localhost IDENTIFIED BY "administrativo123@";

-- Le damos privilegio de lectura sobre todas las tablas de nuestra DB al usuario administrativo_basico
GRANT SELECT ON universidad_privada.* TO administrativo_basico@localhost;

/* Creamos un usuario secretario_academico, quien es nuestro back office y segunda linea de atencion, encargado de la carga de datos pertinentes sobre alumnos y 
docentes de su facultad*/
CREATE USER secretario_academico@localhost IDENTIFIED BY "secacadem123@";

-- la otorgamos privilegios de lectura, insercion y modificacion de datos al usuario creado
GRANT SELECT, INSERT, UPDATE ON univerisdad_privada.* TO secretario_academico@localhost;

/* Cuando creas usuarios o cuando modificas los privilegios de un usuario muchas veces no se reflejan los cambios hasta que reinicias el servidor. 
Este comando fuerza al servidor a recargar los privilegios logrando que dichos cambios se noten al instante sin necesidad de reiniciar. */
FLUSH PRIVILEGES;

SHOW GRANTS FOR administrativo_basico@localhost;
SHOW GRANTS FOR secretario_academico@localhost;
-- SELECT * FROM mysql.user WHERE user LIKE "secretario_academico";