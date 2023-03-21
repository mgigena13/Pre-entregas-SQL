USE universidad_privada;

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

CALL get_docentes_por_materia(2);
CALL get_inscripciones_por_estudiante(43474407);
CALL get_estudiantes_por_materia (1);