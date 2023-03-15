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

SELECT * FROM personas;