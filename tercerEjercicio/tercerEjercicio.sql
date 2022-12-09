
/*Se quiere diseñar una base de datos relacional que almacene información relativa a las escuelas públicas existentes en la República Dominicana, 
así como la cantidad de alumnos que tiene capacidad para alojar, ciudad y barrio o sector donde se encuentra, y presupuesto anual que recibe.
De cada escuela se debe saber los datos de su Director(a), y profesores que la conforman, 
almacenar también si dicho centro educativo es de educación inicial básica o intermedia.*/

CREATE DATABASE escuelas_publicas; 

CREATE TABLE escuelas (
	id_escuela int NOT NULL AUTO_INCREMENT,
    nombre_escuela varchar(150),
    cantidad_alumnos int,
    ciudad_ubicada varchar(100),
    id_sector varchar(50),
    id_presupuesto varchar(50),
    id_director varchar(50),
    id_profesor varchar(50),
    id_nivel_educacion varchar(50),
    PRIMARY KEY(id_escuela)
    /* Relacion con las demas tablas */
    CONSTRAINT fk_aula FOREIGN KEY (id_sector) REFERENCES sectores(id_sector),
    CONSTRAINT fk_pensum FOREIGN KEY (id_presupuesto) REFERENCES presupuestos(id_presupuesto),
    CONSTRAINT fk_carrera FOREIGN KEY (id_director) REFERENCES directores(id_director),
    CONSTRAINT fk_participantes FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor),
    CONSTRAINT fk_trimestres FOREIGN KEY (id_nivel_educacion) REFERENCES niveles_educacion(id_nivel_educacion)
);

CREATE TABLE sectores (
	id_sector varchar(50),
    nombre_sector varchar(100),
    direccion_sector varchar(250),
    PRIMARY KEY (id_sector)
);

CREATE TABLE presupuestos (
	id_presupuesto varchar(50),
    cantidad_anual varchar(100),
    fecha_entrega date,
    PRIMARY KEY (id_presupuesto)
);

CREATE TABLE directores (
	id_director varchar(50),
    nombre_director varchar(100),
    fecha_ingreso date,
    PRIMARY KEY (id_director)
);

CREATE TABLE profesores (
	id_profesor varchar(50),
    nombre_profesor varchar(100),
    titulo_profesor varchar(150),
    PRIMARY KEY (id_profesor),
);

CREATE TABLE niveles_educacion (
	id_nivel_educacion varchar(50),
    nivel varchar(100),
    PRIMARY KEY (id_nivel_educacion)
);