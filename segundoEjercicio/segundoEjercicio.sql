/* BASE DE DATOS */

/*  Creacion de la base de datos principal que se asignaturas UAPA*/
CREATE DATABASE asignaturas_uapa

/* TABLAS */

CREATE TABLE asignaturas (
    id_asg int AUTO_INCREMENT,
    nombre_asg VARCHAR(150) NOT NULL,
    cantidad_creditos int,
    id_aula VARCHAR(50),
    id_asg_pensum VARCHAR(50) NOT NULL,
    id_pensum VARCHAR(50) NOT NULL,
    id_carrera VARCHAR(50),
    id_participante VARCHAR(50),
    id_trimestre VARCHAR(50),
    id_facilitador VARCHAR(50),
    PRIMARY KEY(id_asg),
    /* Relacion con las demas tablas */
    CONSTRAINT fk_aula FOREIGN KEY (id_aula) REFERENCES aula(id_aula),
    CONSTRAINT fk_asignaturas_pensum FOREIGN KEY (id_asg_pensum) REFERENCES asignaturas_pensum(id_asg_pensum),
    CONSTRAINT fk_pensum FOREIGN KEY (id_pensum) REFERENCES pensum(id_pensum),
    CONSTRAINT fk_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera),
    CONSTRAINT fk_participantes FOREIGN KEY (id_participante) REFERENCES participantes(id_participante),
    CONSTRAINT fk_trimestres FOREIGN KEY (id_trimestre) REFERENCES trimestres(id_trimestre),
    CONSTRAINT fk_facilitador FOREIGN KEY (id_facilitador) REFERENCES facilitador(id_facilitador)
);

/*  Creacion de la tabla asignaturas pensum para ver las asignatura y su pensum asociado*/
CREATE TABLE asignaturas_pensum (
    id_asg_pensum VARCHAR(50),
    nombre_asg VARCHAR(150),
    cantidad_creditos int,
    id_pensum VARCHAR(50),
    PRIMARY KEY(id_asg_pensum),
    /* Relacion con la tabla pensum */
    CONSTRAINT fk_asg_pensum FOREIGN KEY (id_pensum) REFERENCES pensum(id_pensum)
);
/*  Creacion de la tabla pensum*/
CREATE TABLE pensum (
    id_pensum VARCHAR(50),
    cantidad_asignaturas int,
    cantidad_creditos int,
    cantidad_trimestres int, 
    PRIMARY KEY(id_pensum)
);
/*  Creacion de la tabla carrera para ver todas las carreras*/
CREATE TABLE carrera (
    id_carrera VARCHAR(50),
    nombre_carrera VARCHAR(100),
    PRIMARY KEY(id_carrera)
);
/*  Creacion de la tabla aula para saber donde se imparte las clases*/
CREATE TABLE aula (
    id_aula VARCHAR(50),
    numero_aula VARCHAR(100),
    maximo_capacidad_es int,
    ubicacion_aula VARCHAR(100),
    PRIMARY KEY(id_aula)
);
/*  Creacion de la tabla trimestre para saber a cual pertenece*/
CREATE TABLE trimestres (
    id_trimestre VARCHAR(50),
    numero_trimestre int,
    PRIMARY KEY(id_trimestre)
);
/*  Creacion de la tabla facilitadores*/
CREATE TABLE facilitador (
    id_facilitador VARCHAR(50),
    nombre_f VARCHAR(150),
    titulos_f VARCHAR(250),
    direccion_f VARCHAR(250),
    PRIMARY KEY(id_facilitador)
);
/*  Creacion de la tabla participante para saber de quien sera la inscripcion*/
CREATE TABLE participantes  (
    id_participante VARCHAR(50),
    nombre_pa VARCHAR(150),
    email_pa VARCHAR(250),
    direccion_pa VARCHAR(250),
    PRIMARY KEY(id_participante)
);


/* SELECT */

/*  EJEMPLO: Creacion del comando SELECT para ver la relacion que tiene las diferentes tablas y asi ver TODOS los datos juntos*/
SELECT * FROM asignaturas AS a_t 
		 JOIN aula AS a ON a_t.id_aula = a.id_aula
         JOIN pensum AS p ON a_t.id_pensum = p.id_pensum
         JOIN asignaturas_pensum AS ap ON a_t.id_asg_pensum  = ap.id_asg_pensum 
         JOIN carrera AS c ON a_t.id_carrera = c.id_carrera
         JOIN participantes AS pa ON a_t.id_participante = pa.id_participante
         JOIN trimestres AS t ON a_t.id_trimestre = t.id_trimestre
         JOIN facilitador AS f ON a_t.id_facilitador = f.id_facilitador
WHERE a_t.id_asg = 9;


/* INSERT */
INSERT INTO `asignaturas_pensum` (`id_asg_pensum`, `nombre_asg`, `cantidad_creditos`, `id_pensum`)
VALUES ('IS85', 'Matematica', 4, 'P_IS'), 
       ('IS84','Ingles', 5, 'P_IS'), 
       ('ME45','Ventas', 3, 'P_ME'), 
       ('ME42','Contabilidad', 3, 'P_ME')
       ('ME63','Contabilidad', 3, 'P_PS');

INSERT INTO `pensum` (`id_pensum`, `cantidad_asignaturas`, `cantidad_creditos`, `cantidad_trimestres`)
VALUES ('P_IS', 32, 80, 20), 
       ('P_ME', 29, 50, 12), 
       ('P_PS', 35, 82, 20);

INSERT INTO `carrera` (`id_carrera`, `nombre_carrera`)
VALUES ('25_C', 'Ingenieria de software'), 
        ('40_C', 'Mercadeo'), 
        ('11_C', 'Contabilidad');

INSERT INTO `aula` (`id_aula`, `numero_aula`, `maximo_capacidad_es`, `ubicacion_aula`)
VALUES ('211_A', '45', 25, 'Segunda puerta debajo de la direccion'), 
        ('333_A', '96', 35, 'Debajo de la direccion'), 
        ('888_A', '63', 30, 'Primera puerta debajo de la direccion');

INSERT INTO `trimestres` (`id_trimestre`, `numero_trimestre`)
VALUES ('77_T', 2), 
        ('40_t', 3), 
        ('66_t', 8);

INSERT INTO `facilitador` (`id_facilitador`, `nombre_f`, `titulos_f`, `direccion_f`)
VALUES ('25_F', 'Juan Perez', 'Ingeniero en software', 'Mella 1, calle 6'), 
        ('22_F', 'Maria Guzman', 'Tecnica en educacion', 'Cienfuego, calle 8'), 
        ('8_F', 'Pedro Salasar', 'Tecnico en Psicologia', 'Cerro de gurabo, calle p85');

INSERT INTO `participantes` (`id_participante`, `nombre_pa`, `email_pa`, `direccion_pa`)
VALUES ('85_P', 'Imanol Perez', 'po@gmail.com', 'Mella 1, calle 6'), 
        ('25_P', 'Teresa Guzman', 'po9658@gmail.com', 'Cienfuego, calle 8'), 
        ('834_P', 'Pedro Guzman', 'rel@gmail.com', 'Cerro de gurabo');




/* INSERT - Problema a resolver */

/*Este es un insert donde se guarda los datos porque la materia que agregamos pertence a ese pensum, que en estes caso es Matematica que pertenece a P_IS*/
INSERT INTO asignaturas (nombre_asg, cantidad_creditos, id_aula, id_asg_pensum ,id_pensum, id_carrera, id_participante ,id_trimestre, id_facilitador)
SELECT nombre_asg, 4, '211_A', 'IS85',id_pensum,'25_C', '85_P', '77_T', '25_F'
FROM asignaturas_pensum 
WHERE nombre_asg = 'Matematica' AND id_pensum = 'P_IS';

INSERT INTO asignaturas (nombre_asg, cantidad_creditos, id_aula, id_asg_pensum ,id_pensum, id_carrera, id_participante ,id_trimestre, id_facilitador)
SELECT nombre_asg, 4, '211_A', 'IS85',id_pensum,'25_C', '25_P', '40_t', '25_F'
FROM asignaturas_pensum 
WHERE nombre_asg = 'Matematica' AND id_pensum = 'P_IS';


/*Este es un insert donde NO se guarda los datos porque la materia que agregamos NO pertence a ese pensum, que en estes caso es Ventas que no pertenece a P_IS*/
INSERT INTO asignaturas (nombre_asg, cantidad_creditos, id_aula, id_asg_pensum ,id_pensum, id_carrera, id_participante ,id_trimestre, id_facilitador)
SELECT nombre_asg, 4, '211_A', 'IS85',id_pensum,'25_C', '85_P', '77_T', '25_F'
FROM asignaturas_pensum 
WHERE nombre_asg = 'Ventas' AND id_pensum = 'P_IS';