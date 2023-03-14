CREATE SCHEMA universidad_privada;
USE universidad_privada;

CREATE TABLE personas(
dni INT NOT NULL PRIMARY KEY UNIQUE,
nombre varchar (50) NOT NULL,
apellido varchar (50) NOT NULL,
email varchar (50) NOT NULL UNIQUE,
domicilio varchar (50) NOT NULL,
telefono varchar (50) NOT NULL,
fecha_de_nacimiento date NOT NULL);

CREATE TABLE rol(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
rol_nombre SET ('Autoridad', 'Docente', 'No docente', 'alumno', 'proveedor') NOT NULL);

CREATE TABLE facultades(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_facultad varchar (50) NOT NULL,
sigla varchar (50) NOT NULL,
fecha_de_creacion_facultad date NOT NULL,
personaID INT NOT NULL,
rolID INT NOT NULL,
foreign key (personaID) REFERENCES personas(dni),
foreign key (rolID) REFERENCES rol(id));

CREATE TABLE carreras(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
facultadID INT NOT NULL,
nombre_carrera varchar (50) NOT NULL,
sigla varchar (50) NOT NULL,
grado SET ('pregrado', 'grado', 'posgrado', 'diplomatura', 'cursos cortos') NOT NULL,
fecha_de_creacion_carrera date NOT NULL,
duracion tinyint NOT NULL,
foreign key (facultadID) REFERENCES facultades(id));

CREATE TABLE anio_cursado(
anio_cursado INT NOT NULL PRIMARY KEY,
nombre_anio varchar (50) NOT NULL);

CREATE TABLE materias(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
carreraID INT NOT NULL,
asignatura varchar (50) NOT NULL,
anio_cursado INT NOT NULL,
tipo_duracion SET ('anual', 'primer semestre', 'segundo semestre') NOT NULL,
foreign key (carreraID) REFERENCES carreras (id),
foreign key (anio_cursado) REFERENCES anio_cursado(anio_cursado));

CREATE TABLE inscripciones(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
personaID INT NOT NULL,
rolID INT NOT NULL,
materiaID INT NOT NULL,
fecha_hora_inscripcion datetime NOT NULL,
foreign key (personaID) REFERENCES personas(dni),
foreign key (rolID) REFERENCES rol(id),
foreign key (materiaID) REFERENCES materias (id));

SELECT * FROM personas;