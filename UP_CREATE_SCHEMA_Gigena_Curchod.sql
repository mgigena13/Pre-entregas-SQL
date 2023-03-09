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
rolID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre SET ('Autoridad', 'Docente', 'No docente', 'alumno', 'proveedor') NOT NULL);

CREATE TABLE facultades(
facultadID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre varchar (50) NOT NULL,
sigla varchar (50) NOT NULL,
fecha_de_creacion date NOT NULL,
personaID INT NOT NULL,
rolID INT NOT NULL,
foreign key (personaID) REFERENCES personas(dni),
foreign key (rolID) REFERENCES rol(rolID));

CREATE TABLE carreras(
carreraID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
facultadID INT NOT NULL,
nombre varchar (50) NOT NULL,
sigla varchar (50) NOT NULL,
grado SET ('pregrado', 'grado', 'posgrado', 'diplomatura', 'cursos cortos') NOT NULL,
fecha_de_creacion date NOT NULL,
duracion tinyint NOT NULL,
foreign key (facultadID) REFERENCES facultades(facultadID));

CREATE TABLE anio_cursado(
anio_cursado INT NOT NULL PRIMARY KEY,
nombre varchar (50) NOT NULL);

CREATE TABLE materias(
materiaID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
carreraID INT NOT NULL,
nombre varchar (50) NOT NULL,
anio_cursado INT NOT NULL,
tipo_duracion SET ('anual', 'primer semestre', 'segundo semestre') NOT NULL,
foreign key (carreraID) REFERENCES carreras (carreraID),
foreign key (anio_cursado) REFERENCES anio_cursado(anio_cursado));

CREATE TABLE inscripciones(
inscripcionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
personaID INT NOT NULL,
rolID INT NOT NULL,
materiaID INT NOT NULL,
fecha_hora_inscripcion datetime NOT NULL,
foreign key (personaID) REFERENCES personas(dni),
foreign key (rolID) REFERENCES rol(rolID),
foreign key (materiaID) REFERENCES materias (materiaID));

SELECT * FROM personas;