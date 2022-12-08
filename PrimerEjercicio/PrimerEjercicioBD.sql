
/* BASE DE DATOS */

/*  Creacion de la base de datos principal que se llamara animales*/
CREATE DATABASE animales;

/* TABLAS */

/*  Creacion de la tabla animales atendidos, que va tener las diferentes relaciones con las otra tablas*/
CREATE TABLE animales_atendidos (
    codigo_animal int NOT NULL AUTO_INCREMENT,
    nombreAnimal varchar(100),
    codigo_tipo_animal varchar(50) NOT NULL,
    codigo_vacuna varchar(50) NOT NULL,
    codigo_veterinatio varchar(50) NOT NULL,
    codigo_servicio varchar(50) NOT NULL,
    fechaDeLACita DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    /* PRIMARY KEY */
    PRIMARY KEY (codigo_animal),
    /* Relacion con las demas tablas */
    CONSTRAINT fk_tipo_de_animal_at FOREIGN KEY (codigo_tipo_animal) 
    REFERENCES tipo_de_animal(codigo_tipo_animal),
    CONSTRAINT fk_vacunas_at FOREIGN KEY (codigo_vacuna) 
    REFERENCES vacunas(codigo_vacuna),
    CONSTRAINT fk_veterinarios_at FOREIGN KEY (codigo_veterinatio) 
    REFERENCES veterinarios(codigo_veterinatio),
    CONSTRAINT fk_servicios_at FOREIGN KEY (codigo_servicio) 
    REFERENCES servicios(codigo_servicio)
);
/*  Creacion de la tabla tipo de animales para diferenciarlos por tipos*/
CREATE TABLE tipo_de_animal (
    codigo_tipo_animal varchar(50) NOT NULL,
    TipoAnimal varchar(50),
    /* PRIMARY KEY */
    PRIMARY KEY (codigo_tipo_animal)
);
/*  Creacion de la tabla vacunas para diferenciarlos por vacunas*/
CREATE TABLE vacunas (
    codigo_vacuna varchar(50) NOT NULL,
    nombreVacuna varchar(100),
    numeroVacuna int,
    /* PRIMARY KEY */
    PRIMARY KEY (codigo_vacuna)
);
/*  Creacion de la tabla veterinarios para diferenciarlos por veterinarios*/
CREATE TABLE veterinarios (
    codigo_veterinatio varchar(50) NOT NULL,
    nombreVeterinario varchar(100),
    especialidaVeterinario varchar(100),
    añosExperienciaVeterinario int,
    /* PRIMARY KEY */
    PRIMARY KEY (codigo_veterinatio)
);


/* SELECT */

/*  Creacion del comando para ver los datos de la tabla animales atendidos*/
SELECT * FROM animales_atendidos;
/*  Creacion del comando para ver todos los datos de la tabla tipo_de_animal*/
SELECT * FROM tipo_de_animal;
/*  Creacion del comando para ver todos los datos de la tabla vacunas*/
SELECT * FROM vacunas;
/*  Creacion del comando para ver todos los datos de la tabla veterinarios*/
SELECT * FROM veterinarios;
/*  Creacion del comando para ver todos los datos de la tabla servicios*/
SELECT * FROM servicios;
/*  EJEMPLO: Creacion del comando SELECT para ver la relacion que tiene las diferentes tablas y asi ver que se puede mostrar campos juntos de diferentes tablas*/
SELECT nombreAnimal, TipoAnimal, nombreVacuna, numeroVacuna, nombreVeterinario, tipoServicio, precioServicio FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 4;
/*  EJEMPLO: Creacion del comando SELECT para ver la relacion que tiene las diferentes tablas y asi ver TODOS los datos juntos*/
SELECT * FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 4;


/* INSERT */

/*  Creacion del comando para insertar los datos a la tabla animales atendidos*/
INSERT INTO `animales_atendidos` (`nombreAnimal`, `codigo_tipo_animal`, `codigo_vacuna`, `codigo_veterinatio`, `codigo_servicio`)
VALUES ('Lobo', '85TA', '85V', '85VE', '85S');

/*  Creacion del comando para insertar los datos a la tabla servicios*/
INSERT INTO `servicios` (`codigo_servicio`, `tipoServicio`, `precioServicio`, `numeroFactura`) VALUES
('85S', 'Operacion de Corazon', '8000 Dolares', '85SF');

/*  Creacion del comando para insertar los datos a la tabla tipo_de_animal*/
INSERT INTO `tipo_de_animal` (`codigo_tipo_animal`, `TipoAnimal`) VALUES
('85TA', 'caprino');

/*  Creacion del comando para insertar los datos a la tabla vacunas*/
INSERT INTO `vacunas` (`codigo_vacuna`, `nombreVacuna`, `numeroVacuna`) VALUES
('85V', 'Sinova', 1);

/*  Creacion del comando para insertar los datos a la tabla veterinarios*/
INSERT INTO `veterinarios` (`codigo_veterinatio`, `nombreVeterinario`, `especialidaVeterinario`, `añosExperienciaVeterinario`) VALUES
('85VE', 'Juan Perez', 'Cirujano', 5);


/* UPDATE */

/*  Creacion del comando para actualizar los datos de las tabla de animales atendidos*/
UPDATE animales_atendidos 
SET nombreAnimal  = 'Example' , codigo_tipo_animal  = 'Example', codigo_vacuna  = 'Example', codigo_veterinatio  = 'Example', codigo_servicio  = 'Example'
WHERE codigo_animal = Example;

/*  Creacion del comando para actualizar los datos de las tabla de tipos de animales*/
UPDATE tipo_de_animal
SET TipoAnimal = 'Example'
WHERE codigo_tipo_animal = 'Example';

/*  Creacion del comando para actualizar los datos de las tabla de vacunas*/
UPDATE vacunas
SET nombreVacuna = 'Example', numeroVacuna ='Example'
WHERE codigo_vacuna = 'Example';

/*  Creacion del comando para actualizar los datos de las tabla de veterinarios*/
UPDATE veterinarios
SET nombreVeterinario = 'Example', especialidaVeterinario = 'Example', añosExperienciaVeterinario = 'Example'
WHERE codigo_veterinatio = 'Example';

/*  Creacion del comando para actualizar los datos de las tabla de servicios*/
UPDATE servicios
SET tipoServicio = 'Example', precioServicio = 'Example', numeroFactura = 'Example'
WHERE codigo_servicio = 'Example';

/* DELETE  */

/*  Creacion del comando para eliminar un registros existentes de la tabla de animales atendidos*/
DELETE FROM animales_atendidos WHERE codigo_animal = 'Example';
/*  Creacion del comando para eliminar un registros existentesde la tabla de codigo tipo animal*/
DELETE FROM tipo_de_animal WHERE codigo_tipo_animal = 'Example';
/*  Creacion del comando para eliminar un registros existentes de la tabla de codigo vacuna*/
DELETE FROM vacunas WHERE codigo_vacuna = 'Example';
/*  Creacion del comando para eliminar un registros existentes de la tabla de codigo veterinatio*/
DELETE FROM veterinarios WHERE codigo_veterinatio = 'Example';
/*  Creacion del comando para eliminar un registros existentes de la tabla de servicios*/
DELETE FROM servicios WHERE codigo_servicio = 'Example';
