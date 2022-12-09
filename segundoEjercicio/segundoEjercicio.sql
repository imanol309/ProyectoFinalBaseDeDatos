CREATE DATABASE asignaturas_uapa

CREATE TABLE asignaturas (
    id_asg int AUTO_INCREMENT,
    nombre_asg VARCHAR(100),
    cantidad_creditos int,
    id_aula VARCHAR(50),
    id_pensum VARCHAR(50),
    id_carrera VARCHAR(50),
    id_participante VARCHAR(50),
    id_trimestre VARCHAR(50),
    id_facilitador VARCHAR(50),
    PRIMARY KEY(id_asg),
    /* Relacion con las demas tablas */
    CONSTRAINT fk_aula FOREIGN KEY (id_aula) REFERENCES aula(id_aula),
    CONSTRAINT fk_pensum FOREIGN KEY (id_pensum) REFERENCES pensum(id_pensum),
    CONSTRAINT fk_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera),
    CONSTRAINT fk_participantes FOREIGN KEY (id_participante) REFERENCES participantes(id_participante),
    CONSTRAINT fk_trimestres FOREIGN KEY (id_trimestre) REFERENCES trimestres(id_trimestre),
    CONSTRAINT fk_facilitador FOREIGN KEY (id_facilitador) REFERENCES facilitador(id_facilitador)
);


INSERT INTO `asignaturas` (`nombre_asg`, `cantidad_creditos`, `id_aula`, `id_pensum`, `id_trimestre`, `id_facilitador`)
VALUES ('Matematica II', 4, '74_AU', '8542_P_IS', '854_T_IS', '251_F');

-- ALTER TABLE asignaturas ADD CONSTRAINT fk_aula FOREIGN KEY (id_aula) REFERENCES aula(id_aula)
-- ALTER TABLE asignaturas ADD CONSTRAINT fk_pensum FOREIGN KEY (id_pensum) REFERENCES pensum(id_pensum)
-- ALTER TABLE asignaturas ADD CONSTRAINT fk_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera)
-- ALTER TABLE asignaturas ADD CONSTRAINT fk_participantes FOREIGN KEY (id_participantes) REFERENCES participantes(id_participantes)
-- ALTER TABLE asignaturas ADD CONSTRAINT fk_trimestres FOREIGN KEY (id_trimestre) REFERENCES trimestres(id_trimestre)
-- ALTER TABLE asignaturas ADD CONSTRAINT fk_facilitador FOREIGN KEY (id_facilitador) REFERENCES facilitador(id_facilitador)

CREATE TABLE pensum (
    id_pensum VARCHAR(50),
    cantidad_asignaturas int,
    cantidad_creditos int,
    cantidad_trimestres int, 
    PRIMARY KEY(id_pensum)
);

INSERT INTO `pensum` (`id_pensum`, `cantidad_asignaturas`, `cantidad_creditos`, `cantidad_trimestres`)
VALUES ('8542_P_IS', 32, 80, 20), ('8596_P_IS', 29, 50, 12), ('4252_P_IS', 35, 82, 20);

CREATE TABLE carrera (
    id_carrera VARCHAR(50),
    nombre_carrera VARCHAR(100),
    PRIMARY KEY(id_carrera)
);

INSERT INTO `carrera` (`id_carrera`, `nombre_carrera`)
VALUES ('25_C', 'Ingenieria de software'), ('40_C', 'Mercadeo'), ('11_C', 'Contabilidad');

CREATE TABLE aula (
    id_aula VARCHAR(50),
    numero_aula VARCHAR(100),
    maximo_capacidad_es int,
    ubicacion_aula VARCHAR(100),
    PRIMARY KEY(id_aula)
);

INSERT INTO `aula` (`id_aula`, `numero_aula`, `maximo_capacidad_es`, `ubicacion_aula`)
VALUES ('211_A', '45', 25, 'Segunda puerta debajo de la direccion'), ('333_A', '96', 35, 'Debajo de la direccion'), 
('888_A', '63', 30, 'Primera puerta debajo de la direccion');

CREATE TABLE trimestres (
    id_trimestre int,
    numero_trimestre int,
    PRIMARY KEY(id_trimestre)
);

INSERT INTO `trimestres` (`id_trimestre`, `numero_trimestre`)
VALUES ('77_T', 2), ('40_t', 3), ('66_t', 8);

CREATE TABLE facilitador (
    id_facilitador VARCHAR(50),
    nombre_f VARCHAR(150),
    titulos_f VARCHAR(250),
    direccion_f VARCHAR(250),
    PRIMARY KEY(id_facilitador)
);

INSERT INTO `facilitador` (`id_facilitador`, `nombre_f`, `titulos_f`, `direccion_f`)
VALUES ('25_F', 'Juan Perez', 'Ingeniero en software', 'Mella 1, calle 6'), ('25_F', 'Maria Guzman', 'Tecnica en educacion', 'Cienfuego, calle 8'), 
('8_F', 'Pedro Salasar', 'Tecnico en Psicologia', 'Cerro de gurabo, calle p85');

CREATE TABLE participantes  (
    id_participante VARCHAR(50),
    nombre_pa VARCHAR(150),
    email_pa VARCHAR(250),
    direccion_pa VARCHAR(250),
    PRIMARY KEY(id_participante)
);

INSERT INTO `participantes` (`id_participante`, `nombre_pa`, `email_pa`, `direccion_pa`)
VALUES ('85_P', 'Imanol Perez', 'po@gmail.com', 'Mella 1, calle 6'), ('25_P', 'Teresa Guzman', 'po9658@gmail.com', 'Cienfuego, calle 8'), 
('834_P', 'Pedro Guzman', 'rel@gmail.com', 'Cerro de gurabo');