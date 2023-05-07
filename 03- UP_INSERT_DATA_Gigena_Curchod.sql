USE universidad_privada;

INSERT INTO anio_cursado (anio_cursado, nombre_anio)
VALUES (1, "Primer año"),
(2, "Segundo año"),
(3, "Tercer año"),
(4, "Cuarto año"),
(5, "Quinto año"),
(6, "Sexto año");

INSERT INTO rol (rol_nombre)
VALUES ("Autoridad"),
("No docente"),
("Docente"),
("Alumno"),
("proveedor");

INSERT INTO facultades (id, nombre_facultad, sigla, fecha_de_creacion_facultad, personaID, rolID)
VALUES (1, "Facultad de Ciencias de la Salud", "fcs", "1981-02-01", 35145692, 1),
(2, "Facultad de Arquitectura, Urbanismo y Diseño", "faud", "1989-02-01", 21407119, 1),
(3, "Facultad de Ingenieria", "fi", "1979-02-01", 36354265, 1);

INSERT INTO carreras (facultadID, nombre_carrera, sigla, grado, fecha_de_creacion_carrera, duracion)
VALUES (1, "Licenciatura en Kinesiologia", "ki", "grado", "1982-02-01", 4),
(1, "Licenciatura en Psicologia", "psi", "grado", "1982-02-01", 5),
(1, "Licenciatura en Nutricion", "nu", "grado", "1982-02-01", 5),
(1, "Técnico en Radiología", "rad", "pregrado", "1982-02-01", 3),
(1, "Técnico en Instrumentación Quirúrgica", "iq", "pregrado", "1982-02-01", 3),
(1, "Técnico en Higiene y Seguridad Laboral", "hys", "pregrado", "1982-02-01", 3),
(2, "Arquitectura", "arq", "grado", "1990-02-01", 5),
(2, "Licenciatura en Diseño Gráfico", "gra", "grado", "1990-02-01", 4),
(2, "Licenciatura en Diseño de Indumentaria", "ind", "grado", "1990-02-01", 4),
(2, "Licenciatura en Diseño de Interiores", "int", "grado", "1990-02-01", 4),
(2, "Corredor Inmobiliario", "ci", "pregrado", "1990-02-01", 3),
(2, "Martillero Público", "ma", "pregrado", "1990-02-01", 3),
(3, "Ingenieria en Sistemas", "is", "grado", "1979-02-01", 5),
(3, "Ingenieria Industrial", "ii", "grado", "1979-02-01", 5),
(3, "Ingenieria Electrónica", "ie", "grado", "1979-02-01", 5);

SELECT * FROM materias;