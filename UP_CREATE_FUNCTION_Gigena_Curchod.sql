USE universidad_privada;

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

SELECT nombre AS Nombre, apellido AS Apellido, calcular_edad(fecha_de_nacimiento, CURDATE()) AS Edad
FROM personas;

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

SELECT cantidad_inscriptos_por_materia(2);