USE universidad_privada;

-- Creao las vistas del esquema
CREATE OR REPLACE VIEW inscriptos AS
(SELECT personaID as documento, materiaID as idm, asignatura as nombre_asignatura, nombre as nombre, apellido as apellido, rolID as idrol, rol_nombre as funcion
FROM inscripciones i
INNER JOIN personas p on (i.personaID = p.dni)
INNER JOIN materias m on (i.materiaID = m.id)
INNER JOIN rol r on (i.rolID = r.id)
ORDER BY asignatura);
 
 CREATE OR REPLACE VIEW oferta_academica AS
(SELECT nombre_carrera as carrera, nombre_facultad as facultad, grado as grado, duracion as duracion
 FROM carreras c
 INNER JOIN facultades f ON (c.facultadID = f.id));

 CREATE OR REPLACE VIEW materia_por_anio_semestre AS
(SELECT asignatura as materia, nombre_carrera as carrera, anio_cursado as año, tipo_duracion as semestre 
 FROM materias m
 INNER JOIN carreras c ON (m.carreraID = c.id)
 ORDER BY carrera, anio_cursado);

 CREATE OR REPLACE VIEW autoridades_facultad AS
(SELECT apellido as Apellido, nombre as Nombre, rol_nombre as rol, nombre_facultad as Facultad
 FROM personas p
 INNER JOIN facultades f ON (p.dni = f.personaID)
 INNER JOIN rol r ON (f.rolID = r.id));
 
 CREATE OR REPLACE VIEW personas_rol AS
(SELECT apellido as Apellido, nombre as Nombre, rol_nombre as rol
 FROM personas p
 INNER JOIN inscripciones i ON (p.dni = i.personaID)
 INNER JOIN rol r ON (i.rolID = r.id));
   
CREATE OR REPLACE VIEW  vista_cargos_dedicacion_sueldo AS
(SELECT cargos_docentes.nombre_cargo, dedicacion_docente.nombre_dedicacion, sueldo_docente.monto
FROM cargos_docentes
INNER JOIN sueldo_docente ON cargos_docentes.id = sueldo_docente.id_cargo
INNER JOIN dedicacion_docente ON dedicacion_docente.id = sueldo_docente.id_dedicacion);

CREATE OR REPLACE VIEW  docentes_con_sueldo AS
(SELECT personas.nombre, personas.apellido, materias.asignatura AS materia, cargos_docentes.nombre_cargo AS cargo, dedicacion_docente.nombre_dedicacion AS dedicacion, sueldo_docente.monto AS monto_a_abonar
FROM personas
INNER JOIN nombramiento_docente ON nombramiento_docente.id_persona = personas.dni
INNER JOIN materias ON materias.id = nombramiento_docente.id_materia
INNER JOIN carreras ON carreras.id = materias.carreraID
INNER JOIN facultades ON facultades.id = carreras.facultadID
INNER JOIN sueldo_docente ON sueldo_docente.id = nombramiento_docente.id_sueldo
INNER JOIN dedicacion_docente ON dedicacion_docente.id = sueldo_docente.id_dedicacion
INNER JOIN cargos_docentes ON cargos_docentes.id = sueldo_docente.id_cargo
WHERE nombramiento_docente.activo = true);

CREATE OR REPLACE VIEW  alumnos_deudores AS
(SELECT p.dni, p.nombre, p.apellido, carreras.nombre_carrera, cuotas.anio, cuotas.mes, cuotas.vencimiento, cuotas.importe
FROM personas p
INNER JOIN cuotas ON p.dni = cuotas.id_persona
INNER JOIN carreras ON cuotas.id_carrera = carreras.id
WHERE cuotas.pagado = 0 AND cuotas.vencimiento < NOW());

-- Creo las funciones del esquema

DELIMITER $$
CREATE FUNCTION calcular_edad(fecha_nacimiento DATE, fecha_actual DATE)
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE edad INT;
  SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, fecha_actual);
  RETURN edad;
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION cantidad_inscriptos_por_materia (materia_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA

BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad
    FROM inscripciones
    WHERE materiaID = materia_id AND rolID = 4;
    RETURN cantidad;
END$$
DELIMITER ;

-- Creo los Stored Procedures del esquema

DELIMITER //
CREATE PROCEDURE get_inscripciones_por_estudiante(IN p_dni INT)
BEGIN
  SELECT inscripciones.id, personas.nombre, personas.apellido, materias.asignatura, materias.tipo_duracion, inscripciones.fecha_hora_inscripcion
  FROM inscripciones
  INNER JOIN personas ON personas.dni = inscripciones.personaID
  INNER JOIN materias ON materias.id = inscripciones.materiaID
  WHERE personas.dni = p_dni;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE get_estudiantes_por_materia(IN p_materiaID INT)
BEGIN
  SELECT personas.nombre, personas.apellido
  FROM inscripciones
  INNER JOIN personas ON personas.dni = inscripciones.personaID
  WHERE inscripciones.materiaID = p_materiaID AND inscripciones.rolID = 4;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE get_docentes_por_materia(IN p_materiaID INT)
BEGIN
SELECT personas.nombre, personas.apellido, rol.rol_nombre
FROM inscripciones
INNER JOIN personas ON personas.dni = inscripciones.personaID
INNER JOIN rol ON rol.id = inscripciones.rolID
WHERE inscripciones.materiaID = p_materiaID AND rol.rol_nombre = 'docente';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE obtener_deuda_total_alumno(
  IN dni DECIMAL(10,2),
  OUT deuda_total DECIMAL(10,2)
)
BEGIN
  SELECT SUM(cuotas.importe) INTO deuda_total
  FROM personas p
  INNER JOIN cuotas ON p.dni = cuotas.id_persona
  INNER JOIN carreras ON cuotas.id_carrera = carreras.id
  WHERE p.dni = dni AND cuotas.pagado = 0 AND cuotas.vencimiento < NOW();
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE monto_total_abonar(IN dni INT, OUT total DECIMAL(10,2))
BEGIN
    SELECT SUM(sueldo_docente.monto) INTO total
    FROM nombramiento_docente
    INNER JOIN sueldo_docente ON nombramiento_docente.id_sueldo = sueldo_docente.id
    WHERE nombramiento_docente.activo = true AND nombramiento_docente.id_persona = dni;
END //

DELIMITER ;

-- Creo los triggers del proyecto e inserto datos para inicializarlos

CREATE TRIGGER `tr_insert_inscripcion_aud`
AFTER INSERT ON `inscripciones`
FOR EACH ROW
INSERT INTO `audits`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('inscripciones', NEW.id, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());

CREATE TRIGGER `tr_insert_persona_aud`
AFTER INSERT ON `personas`
FOR EACH ROW
INSERT INTO `audits`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('personas', NEW.dni, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());

INSERT INTO inscripciones (personaID, rolID, materiaID, fecha_hora_inscripcion)
VALUES (44296778, 4, 1, "2023-03-16 09:00:24");

INSERT INTO inscripciones (personaID, rolID, materiaID, fecha_hora_inscripcion)
VALUES (40456738, 4, 1, "2023-03-16 09:00:24"),
(40503573, 4, 1, "2023-03-16 09:00:24"),
(42991413, 4, 1, "2023-03-16 09:00:24");

-- creamos usuarios de nuestra DB y damos privilegios

/* Creamios el usuario administrativo_basico, quien es la primera linea de atencion de nuestros alumnos. Dicho usuario debera poder acceder a la informacion
sin tener posibilidad de alterarla ni nada por el estilo. Lo que lograremos a traves de los permisos otorgados en la linea siguiente a la creacion*/
CREATE USER administrativo_upmg@localhost IDENTIFIED BY "administrativo123@";

-- Le damos privilegio de lectura sobre todas las tablas de nuestra DB al usuario administrativo_basico
GRANT SELECT ON universidad_privada.* TO administrativo_upmg@localhost;

/* Creamos un usuario secretario_academico, quien es nuestro back office y segunda linea de atencion, encargado de la carga de datos pertinentes sobre alumnos y 
docentes de su facultad*/
CREATE USER secretario_academico_upmg@localhost IDENTIFIED BY "secacadem123@";

-- la otorgamos privilegios de lectura, insercion y modificacion de datos al usuario creado
GRANT SELECT, INSERT, UPDATE ON universidad_privada.* TO secretario_academico_upmg@localhost;

/* Cuando creas usuarios o cuando modificas los privilegios de un usuario muchas veces no se reflejan los cambios hasta que reinicias el servidor. 
Este comando fuerza al servidor a recargar los privilegios logrando que dichos cambios se noten al instante sin necesidad de reiniciar. */
FLUSH PRIVILEGES;

SHOW GRANTS FOR administrativo_basico@localhost;
SHOW GRANTS FOR secretario_academico@localhost;
-- SELECT * FROM mysql.user WHERE user LIKE "secretario_academico";

-- Llamo las vistas para visualizarlas

select * from autoridades_facultad;
select * from inscriptos;
select * from materia_por_anio_semestre;
select * from oferta_academica;
select * from personas_rol;
select * from vista_cargos_dedicacion_sueldo;
select * from docentes_con_sueldo;
select * from alumnos_deudores;

-- Llamo a las funciones

SELECT nombre AS Nombre, apellido AS Apellido, calcular_edad(fecha_de_nacimiento, CURDATE()) AS Edad
FROM personas;

SELECT cantidad_inscriptos_por_materia(2);

-- Llamo a los stored para visualizarlos

CALL get_docentes_por_materia(2);

CALL get_inscripciones_por_estudiante(43474407);

CALL get_estudiantes_por_materia (1);

CALL obtener_deuda_total_alumno(42162232,  @deuda_total);
SELECT @deuda_total;

CALL monto_total_abonar(39546271, @total);
SELECT @total;