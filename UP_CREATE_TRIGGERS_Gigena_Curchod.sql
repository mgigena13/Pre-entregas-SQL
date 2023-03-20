USE universidad_privada;

CREATE TABLE AUDITS (
	id_log INT PRIMARY KEY auto_increment,
    entity varchar(100),
    entity_id int,
    insert_dt datetime,
    created_by varchar(100),
    last_update_dt datetime,
    last_updated_by varchar(100)
);

CREATE TRIGGER `tr_insert_inscripcion_aud`
AFTER INSERT ON `inscripciones`
FOR EACH ROW
INSERT INTO `audits`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('inscripciones', NEW.id, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());

INSERT INTO inscripciones (personaID, rolID, materiaID, fecha_hora_inscripcion)
VALUES (44296778, 4, 1, "2023-03-16 09:00:24");

INSERT INTO inscripciones (personaID, rolID, materiaID, fecha_hora_inscripcion)
VALUES (40456738, 4, 1, "2023-03-16 09:00:24"),
(40503573, 4, 1, "2023-03-16 09:00:24"),
(42991413, 4, 1, "2023-03-16 09:00:24");

SELECT * FROM audits;
SELECT * FROM personas;

CREATE TRIGGER `tr_insert_persona_aud`
AFTER INSERT ON `personas`
FOR EACH ROW
INSERT INTO `audits`(entity, entity_id, insert_dt, created_by, last_update_dt, last_updated_by) 
VALUES ('personas', NEW.dni, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());
