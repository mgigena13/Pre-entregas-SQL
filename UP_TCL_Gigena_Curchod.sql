USE universidad_privada;

SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 0;

-- Desafio Rollback
START TRANSACTION;
UPDATE carreras
SET nombre_carrera = 'No te asustes que es un cambio temporal'
WHERE facultadID = 1;

SELECT * FROM carreras; 

-- Ejecuto Rollback
ROLLBACK;
SELECT * FROM carreras; 

START TRANSACTION;
INSERT INTO personas (dni, nombre, apellido, email, domicilio, telefono, fecha_de_nacimiento)
VALUES (20542879, "Maria Marta", "Zapata", "m.zapata@gmail.com", "Av. de Los Gladiolos 45","3585079845", "1970-01-15"),
(21456987, "Marco Antonio", "Solis", "m.solis@gmail.com", "Granaderos 154","3586789654", "1972-09-12"),
(27894569, "Sofia Vanesa", "Merlo", "s.merlo@gmail.com", "Indio Felipe Rosas 458","3585079845", "1980-02-27"),
(28574321, "Natalia Valeria", "Andrada", "n.andrada@gmail.com", "Olegario Andrada 1784","3582785214", "1981-06-11");
savepoint partida_1;
INSERT INTO personas (dni, nombre, apellido, email, domicilio, telefono, fecha_de_nacimiento)
VALUES (26046087, "Andrea Silvana", "Seiler", "a.seiler77@gmail.com", "Domingo Disanto 2548","3585074721", "1977-10-07"),
(28577455, "Micaela Ines", "Piacenza", "m.piacenza@gmail.com", "Saavedra 457","3515874568", "1981-04-09"),
(30874587, "Federico", "Vorochecivi", "f.vorochevici@gmail.com", "Amadeo Mozart 483","3585452985", "1983-08-24"),
(27468723, "Maria Cecilia", "Ramirez", "C.ramirez@gmail.com", "Dilkendein 1231","3584587489", "1979-04-11");
savepoint partida_2;

-- Elimino el savepoint partida_ 1
#RELEASE SAVEPOINT partida_1;

-- OJO con ejecutar la sentencia commit que despues no hay arreglo

# COMMIT; 

select * FROM inscripciones;