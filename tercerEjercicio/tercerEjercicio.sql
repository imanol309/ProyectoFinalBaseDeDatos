
/*Se quiere diseñar una base de datos relacional que almacene información relativa a las escuelas públicas existentes en la República Dominicana, 
así como la cantidad de alumnos que tiene capacidad para alojar, ciudad y barrio o sector donde se encuentra, y presupuesto anual que recibe.
De cada escuela se debe saber los datos de su Director(a), y profesores que la conforman, 
almacenar también si dicho centro educativo es de educación inicial básica o intermedia.*/

/* BASE DE DATOS */

CREATE DATABASE escuelas_publicas; 

/* TABLAS */

CREATE TABLE escuelas (
	id_escuela int NOT NULL AUTO_INCREMENT,
    nombre_escuela varchar(150),
    cantidad_alumnos int,
    ciudad_ubicada varchar(100),
    id_sector varchar(50),
    id_presupuesto varchar(50),
    id_director varchar(50),
    id_nivel_educacion varchar(50),
    PRIMARY KEY(id_escuela),
    /* Relacion con las demas tablas */
    CONSTRAINT fk_aula FOREIGN KEY (id_sector) REFERENCES sectores(id_sector),
    CONSTRAINT fk_pensum FOREIGN KEY (id_presupuesto) REFERENCES presupuestos(id_presupuesto),
    CONSTRAINT fk_carrera FOREIGN KEY (id_director) REFERENCES directores(id_director),
    CONSTRAINT fk_trimestres FOREIGN KEY (id_nivel_educacion) REFERENCES niveles_educacion(id_nivel_educacion)
);

CREATE TABLE sectores (
	id_sector varchar(50),
    nombre_sector varchar(100),
    direccion_sector varchar(250),
     /* PRIMARY KEY */
    PRIMARY KEY (id_sector)
);

CREATE TABLE presupuestos (
	id_presupuesto varchar(50),
    cantidad_anual varchar(100),
     /* PRIMARY KEY */
    PRIMARY KEY (id_presupuesto)
);

CREATE TABLE directores (
	id_director varchar(50),
    nombre_director varchar(100),
     /* PRIMARY KEY */
    PRIMARY KEY (id_director)
);

CREATE TABLE profesores (
	id_profesor varchar(50),
    nombre_profesor varchar(100),
    titulo_profesor varchar(150),
    id_escuela int,
     /* PRIMARY KEY */
    PRIMARY KEY (id_profesor),
    /* Relacion con la tabla escuelas */
    CONSTRAINT fk_participantes FOREIGN KEY (id_escuela) REFERENCES escuelas(id_escuela)
);

CREATE TABLE niveles_educacion (
	id_nivel_educacion varchar(50),
    nivel varchar(100),
     /* PRIMARY KEY */
    PRIMARY KEY (id_nivel_educacion)
);

/* SELECT */

/*  Creacion del comando para ver los datos de la tabla escuelas*/
SELECT * FROM escuelas;
/*  Creacion del comando para ver todos los datos de la tabla sectores*/
SELECT * FROM sectores;
/*  Creacion del comando para ver todos los datos de la tabla presupuestos*/
SELECT * FROM presupuestos;
/*  Creacion del comando para ver todos los datos de la tabla directores*/
SELECT * FROM directores;
/*  Creacion del comando para ver todos los datos de la tabla niveles educacion*/
SELECT * FROM niveles_educacion;
/*  Creacion del comando para ver todos los datos de la tabla profesores*/
SELECT * FROM profesores;


/* INSERT */

/*  EJEMPLO: Creacion del comando INSERT para agregar datos a la tabla principal*/
INSERT INTO `escuelas` (`nombre_escuela`, `cantidad_alumnos`, `ciudad_ubicada`,`id_sector`, `id_presupuesto`,  `id_director`, `id_nivel_educacion`)
VALUES ('Elidad Mercedes Romero', 260, 'Santiago de los caballeros', '2_S', '5_P', '5_D', '74_ND'), 
        ('Duber Novo', 460, 'Santiago de los caballeros', '4_S', '6_P', '6_D', '25_ND'), 

/*  Creacion del comando para insertar los datos a la tabla sectores*/
INSERT INTO `sectores` (`id_sector`, `nombre_sector`, `direccion_sector`)
VALUES ('2_S', 'Mella I', 'Mella I, calle 6'), 
        ('4_S', 'Cienfuegos', 'Cienfuegos, calle 6'), 

/*  Creacion del comando para insertar los datos a la tabla presupuestos*/
INSERT INTO `presupuestos` (`id_presupuesto`, `cantidad_anual`)
VALUES ('5_P', '2 Millones'), 
        ('6_P', '3 Millones'), 

/*  Creacion del comando para insertar los datos a la tabla directores*/
INSERT INTO `directores` (`id_director`, `nombre_director`)
VALUES ('5_D', 'Juan Guzman'), 
        ('6_D', 'Maria Salasar')

/*  Creacion del comando para insertar los datos a la tabla profesores*/
INSERT INTO `profesores` (`id_profesor`, `nombre_profesor`, `titulo_profesor`, `id_escuela`)
VALUES ('74F4_P','Julian Guzman','Ingeniero en informatica', 1), 
        ('2854_P','Pedro Martinez','Psicologo', 2), 

/*  Creacion del comando para insertar los datos a la tabla niveles_educacion*/
INSERT INTO `niveles_educacion` (`id_nivel_educacion`, `nivel`)
VALUES ('74_ND', 'básica '), 
        ('25_ND', 'intermedia')