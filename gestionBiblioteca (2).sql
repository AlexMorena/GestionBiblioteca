-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-02-2025 a las 18:43:56
-- Versión del servidor: 8.0.41-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionBiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administradores`
--

CREATE TABLE `Administradores` (
  `idUsuario` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contrasenia` varchar(30) DEFAULT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Administradores`
--

INSERT INTO `Administradores` (`idUsuario`, `email`, `contrasenia`, `Nombre`) VALUES
(1, 'alexmorena2002@gmail.com', '1234', 'Alex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Documento`
--

CREATE TABLE `Documento` (
  `idDocumento` int NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `ListaAutores` varchar(100) DEFAULT NULL,
  `FechaPublicacion` date DEFAULT NULL,
  `Editorial` varchar(100) DEFAULT NULL,
  `NumEjemplares` tinyint DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Materia` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Documento`
--

INSERT INTO `Documento` (`idDocumento`, `Titulo`, `ListaAutores`, `FechaPublicacion`, `Editorial`, `NumEjemplares`, `Descripcion`, `Materia`) VALUES
(1, 'Multimedia Netflix', 'Autor 1', '2020-01-01', 'Netflix', 10, 'Plataforma De Contenido', 'Entretenimiento'),
(2, 'Multimedia HBO', 'Autor 2', '2021-02-02', 'HBO', 5, 'Plataforma De Contenido', 'Entretenimiento'),
(3, 'Revista Pais', 'Autor 3', '2019-03-03', 'EL Pais', 7, 'Periodico', 'Entretenimiento'),
(4, 'Libro Harry Potter', 'Autor 4', '2018-04-04', 'HArryP', 3, 'Libro de Ficcion', 'Ficcion'),
(5, 'Libro del bicho', 'Autor 5', '2017-05-05', 'El bicho', 8, 'BICHO E', 'Futbol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ejemplar`
--

CREATE TABLE `Ejemplar` (
  `IdEjemplar` int NOT NULL,
  `idDocumento` int DEFAULT NULL,
  `Localizacion` varchar(50) DEFAULT NULL,
  `Prestado` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Ejemplar`
--

INSERT INTO `Ejemplar` (`IdEjemplar`, `idDocumento`, `Localizacion`, `Prestado`) VALUES
(1, 1, 'Estantería A1', 0),
(2, 2, 'Estantería B2', 1),
(3, 3, 'Estantería C3', 0),
(4, 4, 'Estantería D4', 1),
(5, 5, 'Estantería E5', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Libro`
--

CREATE TABLE `Libro` (
  `idDocumento` int NOT NULL,
  `ISBN` varchar(9) DEFAULT NULL,
  `numPaginas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Libro`
--

INSERT INTO `Libro` (`idDocumento`, `ISBN`, `numPaginas`) VALUES
(4, '123456789', 200),
(5, '234567890', 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Multimedia`
--

CREATE TABLE `Multimedia` (
  `idDocumento` int NOT NULL,
  `Soporte` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Multimedia`
--

INSERT INTO `Multimedia` (`idDocumento`, `Soporte`) VALUES
(1, 'DVD'),
(2, 'CD-ROM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Prestar`
--

CREATE TABLE `Prestar` (
  `IdUsuario` int NOT NULL,
  `IdEjemplar` int NOT NULL,
  `FechaP` date DEFAULT NULL,
  `FechaD` date DEFAULT NULL,
  `Observacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Prestar`
--

INSERT INTO `Prestar` (`IdUsuario`, `IdEjemplar`, `FechaP`, `FechaD`, `Observacion`) VALUES
(1, 1, '2025-02-01', '2025-02-10', 'En buen estado'),
(2, 2, '2025-02-02', '2025-02-12', 'Leve desgaste'),
(3, 3, '2025-02-03', '2025-02-15', 'Sin daños'),
(4, 4, '2025-02-04', '2025-02-18', 'Rayones en la tapa'),
(5, 5, '2025-02-05', '2025-02-20', 'Páginas dobladas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Revista`
--

CREATE TABLE `Revista` (
  `idDocumento` int NOT NULL,
  `ISBN` varchar(9) DEFAULT NULL,
  `Frecuencia` enum('diario','semanal','mensual','anual') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Revista`
--

INSERT INTO `Revista` (`idDocumento`, `ISBN`, `Frecuencia`) VALUES
(3, '987654321', 'mensual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `IdUsuario` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Curso` int DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Contrasena` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`IdUsuario`, `Nombre`, `Direccion`, `Telefono`, `Curso`, `Email`, `Contrasena`) VALUES
(1, 'Carlos Pérez', 'Calle Ficticia 123', '612345678', 2, 'carlos.perez@email.com', '1234'),
(2, 'Ana Gómez', 'Avenida Siempre Viva 456', '623456789', 3, 'ana.gomez@email.com', '1234'),
(3, 'Luis Martínez', 'Calle Real 789', '634567890', 1, 'luis.martinez@email.com', '1234'),
(4, 'Marta Rodríguez', 'Calle Sol 234', '645678901', 4, 'marta.rodriguez@email.com', '1234'),
(5, 'Pedro Fernández', 'Calle Luna 567', '656789012', 2, 'pedro.fernandez@email.com', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Administradores`
--
ALTER TABLE `Administradores`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `Documento`
--
ALTER TABLE `Documento`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `Ejemplar`
--
ALTER TABLE `Ejemplar`
  ADD PRIMARY KEY (`IdEjemplar`),
  ADD KEY `idDocumento` (`idDocumento`);

--
-- Indices de la tabla `Libro`
--
ALTER TABLE `Libro`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `Multimedia`
--
ALTER TABLE `Multimedia`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `Prestar`
--
ALTER TABLE `Prestar`
  ADD PRIMARY KEY (`IdUsuario`,`IdEjemplar`),
  ADD KEY `IdEjemplar` (`IdEjemplar`);

--
-- Indices de la tabla `Revista`
--
ALTER TABLE `Revista`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Administradores`
--
ALTER TABLE `Administradores`
  MODIFY `idUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Documento`
--
ALTER TABLE `Documento`
  MODIFY `idDocumento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Ejemplar`
--
ALTER TABLE `Ejemplar`
  MODIFY `IdEjemplar` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `IdUsuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Ejemplar`
--
ALTER TABLE `Ejemplar`
  ADD CONSTRAINT `Ejemplar_ibfk_1` FOREIGN KEY (`idDocumento`) REFERENCES `Documento` (`idDocumento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Libro`
--
ALTER TABLE `Libro`
  ADD CONSTRAINT `Libro_ibfk_1` FOREIGN KEY (`idDocumento`) REFERENCES `Documento` (`idDocumento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Multimedia`
--
ALTER TABLE `Multimedia`
  ADD CONSTRAINT `Multimedia_ibfk_1` FOREIGN KEY (`idDocumento`) REFERENCES `Documento` (`idDocumento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Prestar`
--
ALTER TABLE `Prestar`
  ADD CONSTRAINT `Prestar_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`IdUsuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `Prestar_ibfk_2` FOREIGN KEY (`IdEjemplar`) REFERENCES `Ejemplar` (`IdEjemplar`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Revista`
--
ALTER TABLE `Revista`
  ADD CONSTRAINT `Revista_ibfk_1` FOREIGN KEY (`idDocumento`) REFERENCES `Documento` (`idDocumento`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
