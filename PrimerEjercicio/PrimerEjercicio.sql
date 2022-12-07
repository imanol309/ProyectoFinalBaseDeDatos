 /*  Creacion de la base de datos principal */
CREATE DATABASE animales;

 /*  Creacion de la tabla animales atendidos, que va tener las diferentes relaciones con las otra tablas*/
CREATE TABLE animales_atendidos (
    codigo_animal int NOT NULL AUTO_INCREMENT,
    nombreAnimal varchar(100),
    codigo_tipo_animal varchar(50) NOT NULL,
    codigo_vacuna varchar(50) NOT NULL,
    codigo_veterinatio varchar(50) NOT NULL,
    codigo_servicio varchar(50) NOT NULL,
    fechaDeLACita DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (codigo_animal),
    CONSTRAINT fk_tipo_de_animal_at FOREIGN KEY (codigo_tipo_animal) 
    REFERENCES tipo_de_animal(codigo_tipo_animal),
    CONSTRAINT fk_vacunas_at FOREIGN KEY (codigo_vacuna) 
    REFERENCES vacunas(codigo_vacuna),
    CONSTRAINT fk_veterinarios_at FOREIGN KEY (codigo_veterinatio) 
    REFERENCES veterinarios(codigo_veterinatio),
    CONSTRAINT fk_servicios_at FOREIGN KEY (codigo_servicio) 
    REFERENCES servicios(codigo_servicio)
);

 /*  Creacion del comando para ver los datos de la tabla animales atendidos*/
SELECT * FROM animales_atendidos;

 /*  Creacion del comando para insertar los datos a la tabla animales atendidos*/
INSERT INTO animales_atendidos (nombreAnimal, codigo_tipo_animal, codigo_vacuna, codigo_veterinatio, codigo_servicio)
VALUES ('Example', 'Example', 'Example', 'Example', 'Example');

 /*  Creacion de la tabla tipo de animales para diferenciarlos por tipos*/
CREATE TABLE tipo_de_animal (
    codigo_tipo_animal varchar(50) NOT NULL,
    TipoAnimal varchar(50),
    PRIMARY KEY (codigo_tipo_animal)
);

 /*  Creacion del comando para actualizar los datos de las tabla de tipos de animales*/
UPDATE tipo_de_animal
SET TipoAnimal = 'Example'
WHERE codigo_tipo_animal = 'Example';

 /*  Creacion del comando para ver todos los datos de la tabla tipo_de_animal*/
SELECT * FROM tipo_de_animal;

 /*  Creacion de la tabla vacunas para diferenciarlos por vacunas*/
CREATE TABLE vacunas (
    codigo_vacuna varchar(50) NOT NULL,
    nombreVacuna varchar(100),
    numeroVacuna int,
    PRIMARY KEY (codigo_vacuna)
);

 /*  Creacion del comando para actualizar los datos de las tabla de vacunas*/
UPDATE vacunas
SET nombreVacuna = 'Example', numeroVacuna ='Example'
WHERE codigo_vacuna = 'Example';

 /*  Creacion del comando para ver todos los datos de la tabla vacunas*/
SELECT * FROM vacunas;

 /*  Creacion de la tabla veterinarios para diferenciarlos por veterinarios*/
CREATE TABLE veterinarios (
    codigo_veterinatio varchar(50) NOT NULL,
    nombreVeterinario varchar(100),
    especialidaVeterinario varchar(100),
    añosExperienciaVeterinario int,
    PRIMARY KEY (codigo_veterinatio)
);

 /*  Creacion del comando para actualizar los datos de las tabla de tipos de veterinarios*/
UPDATE veterinarios
SET nombreVeterinario = 'Example', especialidaVeterinario = 'Example', añosExperienciaVeterinario = 'Example'
WHERE codigo_veterinatio = 'Example';

 /*  Creacion del comando para ver todos los datos de la tabla veterinarios*/
SELECT * FROM veterinarios;

 /*  Creacion de la tabla servicios para diferenciarlos por todos los servicios facturados*/
CREATE TABLE servicios (
    codigo_servicio varchar(50) NOT NULL,
    tipoServicio varchar(100),
    precioServicio varchar(250),
    numeroFactura varchar(100),
    PRIMARY KEY (codigo_servicio)
);

 /*  Creacion del comando para actualizar los datos de las tabla de tipos de servicios*/
UPDATE servicios
SET tipoServicio = 'Example', precioServicio = 'Example', numeroFactura = 'Example'
WHERE codigo_servicio = 'Example';

 /*  Creacion del comando para ver todos los datos de la tabla servicios*/
SELECT * FROM servicios;

/*  Creacion del disparador animales_insert_ai para que cada ves que se agrege un nuevo animal antendido, se genere un nuevo campo con el codigo en las diferentes tablas que estan asociadas por relacion,
que son las tablas: tipo_de_animal, vacunas, veterinarios, servicios*/
DELIMITER //
CREATE TRIGGER animales_insert_ai AFTER INSERT ON animales_atendidos 
FOR EACH ROW
BEGIN
	INSERT INTO tipo_de_animal(codigo_tipo_animal) VALUES (NEW.codigo_tipo_animal);
    INSERT INTO vacunas(codigo_vacuna) VALUES (NEW.codigo_vacuna);
    INSERT INTO veterinarios(codigo_veterinatio) VALUES (NEW.codigo_veterinatio);
    INSERT INTO servicios(codigo_servicio) VALUES (NEW.codigo_servicio);
END//
DELIMITER ;

/*  Creacion del disparador animales_delete_ai para que cada ves que se elimine un campo en la tabla principal animales_atendidos, se eliminen los campos que estan asociados a ese codigo de relacion,
que son las tablas: tipo_de_animal, vacunas, veterinarios, servicios*/
DELIMITER //
CREATE TRIGGER animales_delete_ai AFTER DELETE ON animales_atendidos 
FOR EACH ROW
BEGIN
	DELETE FROM tipo_de_animal WHERE codigo_tipo_animal = animales_atendidos.codigo_tipo_animal;
    DELETE FROM vacunas WHERE codigo_vacuna = animales_atendidos.codigo_vacuna;
   	DELETE FROM veterinarios WHERE codigo_veterinatio = animales_atendidos.codigo_veterinatio;
   	DELETE FROM servicios WHERE codigo_servicio = animales_atendidos.codigo_servicio;
END//
DELIMITER ;

 /*  Creacion del comando para poder selecionar y ver cualquier dato de las diferentes tablas que estan asociadas por relacion a la tabla principal animales_atendidos*/
SELECT * FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 'example';


 /*  EJEMPLO: Creacion del comando SELECT para ver la relacion que tiene las diferentes tablas y asi ver que se puede mostrar campos juntos de diferentes tablas*/
SELECT nombreAnimal, TipoAnimal, nombreVacuna, numeroVacuna, nombreVeterinario, tipoServicio, precioServicio FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 1;

SELECT nombreAnimal, TipoAnimal, nombreVacuna, numeroVacuna, nombreVeterinario, tipoServicio, precioServicio FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 2;

SELECT nombreAnimal, TipoAnimal, nombreVacuna, numeroVacuna, nombreVeterinario, tipoServicio, precioServicio FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 3;

INSERT INTO animales_atendidos (nombreAnimal, codigo_tipo_animal, codigo_vacuna, codigo_veterinatio, codigo_servicio)
VALUES ('Papo', '85TA', '80V', '85VE','85S');


INSERT INTO `servicios` (`codigo_servicio`, `tipoServicio`, `precioServicio`, `numeroFactura`) VALUES
(('85S', 'Operacion de Corazon', '8000 Dolares', '85SF'), ('75S', 'Gripe bulmonar', '500 Dolares', '75SF'), ('4S', 'lesión cerebral', '1500 Dolares', '4SF'),);

INSERT INTO `tipo_de_animal` (`codigo_tipo_animal`, `TipoAnimal`) VALUES
(('85TA', 'caprino'), ('25TA', 'canino'),('966TA', 'bovino'),);

INSERT INTO `vacunas` (`codigo_vacuna`, `nombreVacuna`, `numeroVacuna`) VALUES
(('85V', 'Sinova', 1), ('22V', 'Senon', 2),('96V', 'BCG', 3),);

INSERT INTO `veterinarios` (`codigo_veterinatio`, `nombreVeterinario`, `especialidaVeterinario`, `añosExperienciaVeterinario`) VALUES
(('85VE', 'Juan Perez', 'Cirujano', 5), ('72VE', 'Juan Perez', 'Cirujano', 5), ('333VE', 'Maria Guzman', 'Fisioterapia', 12),);

INSERT INTO `animales_atendidos` (`nombreAnimal`, `codigo_tipo_animal`, `codigo_vacuna`, `codigo_veterinatio`, `codigo_servicio`) VALUES
(('Lobo', '85TA', '85V', '85VE', '85S'), ('perro ', '25TA', '22V', '72VE', '75S'), ('Vaca', '966TA', '96V', '333VE', '4S'), );

 /*  EJEMPLO: Creacion del comando SELECT para ver la relacion que tiene las diferentes tablas y asi ver todos los datos juntos*/
SELECT * FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 1;

SELECT * FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 2;

SELECT * FROM animales_atendidos AS A 
		 JOIN tipo_de_animal AS T ON A.codigo_tipo_animal = T.codigo_tipo_animal
         JOIN vacunas AS V ON A.codigo_vacuna = V.codigo_vacuna
         JOIN veterinarios AS VT ON A.codigo_veterinatio = VT.codigo_veterinatio
         JOIN servicios AS S ON A.codigo_servicio = S.codigo_servicio
WHERE A.codigo_animal = 3;