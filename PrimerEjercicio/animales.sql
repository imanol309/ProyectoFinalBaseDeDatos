-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2022 a las 20:59:15
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `animales`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales_atendidos`
--

CREATE TABLE `animales_atendidos` (
  `codigo_animal` int(11) NOT NULL,
  `nombreAnimal` varchar(100) DEFAULT NULL,
  `codigo_tipo_animal` varchar(50) NOT NULL,
  `codigo_vacuna` varchar(50) NOT NULL,
  `codigo_veterinatio` varchar(50) NOT NULL,
  `codigo_servicio` varchar(50) NOT NULL,
  `fechaDeLACita` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `animales_atendidos`
--

INSERT INTO `animales_atendidos` (`codigo_animal`, `nombreAnimal`, `codigo_tipo_animal`, `codigo_vacuna`, `codigo_veterinatio`, `codigo_servicio`, `fechaDeLACita`) VALUES
(3, 'Lobo', '85TA', '85V', '85VE', '85S', '2022-12-07 15:26:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `codigo_servicio` varchar(50) NOT NULL,
  `tipoServicio` varchar(100) DEFAULT NULL,
  `precioServicio` varchar(250) DEFAULT NULL,
  `numeroFactura` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`codigo_servicio`, `tipoServicio`, `precioServicio`, `numeroFactura`) VALUES
('85S', 'Operacion de Corazon', '8000 Dolares', '85SF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_animal`
--

CREATE TABLE `tipo_de_animal` (
  `codigo_tipo_animal` varchar(50) NOT NULL,
  `TipoAnimal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_de_animal`
--

INSERT INTO `tipo_de_animal` (`codigo_tipo_animal`, `TipoAnimal`) VALUES
('85TA', 'caprinos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `codigo_vacuna` varchar(50) NOT NULL,
  `nombreVacuna` varchar(100) DEFAULT NULL,
  `numeroVacuna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`codigo_vacuna`, `nombreVacuna`, `numeroVacuna`) VALUES
('85V', 'Sinova', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinarios`
--

CREATE TABLE `veterinarios` (
  `codigo_veterinatio` varchar(50) NOT NULL,
  `nombreVeterinario` varchar(100) DEFAULT NULL,
  `especialidaVeterinario` varchar(100) DEFAULT NULL,
  `añosExperienciaVeterinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinarios`
--

INSERT INTO `veterinarios` (`codigo_veterinatio`, `nombreVeterinario`, `especialidaVeterinario`, `añosExperienciaVeterinario`) VALUES
('85VE', 'Juan Perez', 'Cirujano', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animales_atendidos`
--
ALTER TABLE `animales_atendidos`
  ADD PRIMARY KEY (`codigo_animal`),
  ADD KEY `fk_tipo_de_animal_at` (`codigo_tipo_animal`),
  ADD KEY `fk_vacunas_at` (`codigo_vacuna`),
  ADD KEY `fk_veterinarios_at` (`codigo_veterinatio`),
  ADD KEY `fk_servicios_at` (`codigo_servicio`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`codigo_servicio`);

--
-- Indices de la tabla `tipo_de_animal`
--
ALTER TABLE `tipo_de_animal`
  ADD PRIMARY KEY (`codigo_tipo_animal`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`codigo_vacuna`);

--
-- Indices de la tabla `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD PRIMARY KEY (`codigo_veterinatio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animales_atendidos`
--
ALTER TABLE `animales_atendidos`
  MODIFY `codigo_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animales_atendidos`
--
ALTER TABLE `animales_atendidos`
  ADD CONSTRAINT `fk_servicios_at` FOREIGN KEY (`codigo_servicio`) REFERENCES `servicios` (`codigo_servicio`),
  ADD CONSTRAINT `fk_tipo_de_animal_at` FOREIGN KEY (`codigo_tipo_animal`) REFERENCES `tipo_de_animal` (`codigo_tipo_animal`),
  ADD CONSTRAINT `fk_vacunas_at` FOREIGN KEY (`codigo_vacuna`) REFERENCES `vacunas` (`codigo_vacuna`),
  ADD CONSTRAINT `fk_veterinarios_at` FOREIGN KEY (`codigo_veterinatio`) REFERENCES `veterinarios` (`codigo_veterinatio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
