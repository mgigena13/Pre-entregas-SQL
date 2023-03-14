USE universidad_privada;

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
   
select * from autoridades_facultad;
select * from inscriptos;
select * from materia_por_anio_semestre;
select * from oferta_academica;
select * from personas_rol;