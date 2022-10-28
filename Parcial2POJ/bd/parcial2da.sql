-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2022 a las 21:30:11
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial2da`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `id` int(11) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fmt` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calendario`
--

INSERT INTO `calendario` (`id`, `archivo`, `fmt`) VALUES
(2, 'https://drive.google.com/drive/folders/1qBcmwtNbwBGI1XHcS8va7a8hqEcIYvFa?usp=sharing', 'https://drive.google.com/drive/folders/1JrfiiQLo5N1JD-WWRXNqKlMAN-BnPa65?usp=sharing');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinadores`
--

CREATE TABLE `coordinadores` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `facul` varchar(40) NOT NULL,
  `tel` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coordinadores`
--

INSERT INTO `coordinadores` (`id`, `cedula`, `nombre`, `facul`, `tel`, `id_user`) VALUES
(4, 45671, 'lola lolita', 'FCNI', 6436463, 18),
(5, 23091234, 'Yoongi Min', 'FCSE', 376820180, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `programa` varchar(20) NOT NULL,
  `semestre` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `cedula`, `nombre`, `programa`, `semestre`, `fecha_nac`, `id_user`) VALUES
(1, 9362467, 'Jhon Dae World', 'SISTEMAS', 6, '2001-12-07', 2),
(3, 764567, 'lola lolita', 'AMBIENTAL', 9, '2001-12-05', 7),
(4, 87654567, 'Lionel Messi', 'TOPOGRAFIA', 9, '2001-12-05', 8),
(6, 1005296667, 'Jennifer ', 'DERECHO', 4, '2001-05-03', 19),
(8, 87654567, 'Alex Cubito', 'Arquitectura', 9, '2001-08-22', 23),
(9, 345678, 'Daniel AA', 'SISTEMAS', 4, '2001-07-26', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_investigacion`
--

CREATE TABLE `linea_investigacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `area` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `linea_investigacion`
--

INSERT INTO `linea_investigacion` (`id`, `nombre`, `area`) VALUES
(2, 'Ingeniería y Tecnología del Software.', 'SISTEMAS'),
(3, ' Informática Industrial y Tecnología Electrónica.', 'SISTEMAS'),
(4, ' Lógica, Computación e Inteligencia', 'SISTEMAS'),
(6, 'Tecnología de Computadores: aplicaciones médicas ', 'SISTEMAS'),
(9, ' Estado Social de Derecho, Justicias y Formación Jurídica', 'DERECHO'),
(10, 'Paisaje y Espacio público.', 'Arquitectura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `area` varchar(40) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `cat` varchar(15) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `cedula`, `nombre`, `area`, `tel`, `cat`, `id_user`) VALUES
(1, 345678, 'Lionel Messi', 'deportes', '6436463', 'DOCTORADO', 11),
(2, 764567, 'lola lolita', 'BIOLOGIA', '6436463', 'ESPECIALISTA', 12),
(5, 28976143, 'lina maria de la purisima concepcion ', 'DISEÑO INDUSTRIAL', '6754906', 'MAESTRIA', 20),
(6, 1098765432, 'MILUSANO RODRIGUEZ', 'INTRODUCCION AL DEPORTE', '3016754309', 'DOCTORADO', 21),
(9, 764567, 'Pedro Benito', 'deportes', '3016754309', 'PROFESIONAL', 24),
(10, 13191, 'Ivan Porky', 'DERECHO', '4879', 'DOCTORADO', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id_pro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `linea_invg` int(11) NOT NULL,
  `facul` varchar(30) NOT NULL,
  `prog` varchar(50) NOT NULL,
  `apro` varchar(20) DEFAULT NULL,
  `id_pro_eva` int(11) DEFAULT NULL,
  `id_pro_dir` int(11) DEFAULT NULL,
  `fmt` mediumblob NOT NULL,
  `id_est` int(11) DEFAULT NULL,
  `apro_dir` varchar(10) DEFAULT NULL,
  `apro_eva` varchar(11) DEFAULT NULL,
  `url_fmt` varchar(100) NOT NULL,
  `estado` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_pro`, `titulo`, `linea_invg`, `facul`, `prog`, `apro`, `id_pro_eva`, `id_pro_dir`, `fmt`, `id_est`, `apro_dir`, `apro_eva`, `url_fmt`, `estado`) VALUES
(12, 'StarUP', 4, 'FCNI', 'SISTEMAS', 'N° 67116', 5, 2, 0x416e616c697369732054616c6c657220352e646f6378, 1, 'N° 5645', 'N° 83450', '', 'Aprobado'),
(17, 'Control disciplinario y corrupción administrativa en el Distrito Capital ', 9, 'FCSE', 'DERECHO', 'N° 52549', 9, 5, '', 6, 'N° 488', NULL, 'https://es-la.facebook.com/', 'Aprobado Director'),
(18, 'Algp para aqrquis', 10, 'FCSE', 'Arquitectura', 'N° 32994', 5, 9, '', 8, 'N° 74789', 'N° 76302', 'https://es-la.facebook.com/', 'Aprobado'),
(19, 'Seguridad con el IoT', 3, 'FCNI', 'SISTEMAS', 'N° 62147', 5, 9, 0x416e616c697369732054616c6c657220312e646f6378, 9, 'N° 35156', 'N° 74861', 'https://drive.google.com/file/d/1lYngBwItRoRZUkcBx-Nob6NoXVEDWESD/view?usp=sharing', 'Aprobado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(15) NOT NULL,
  `pass` int(11) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `pass`, `rol`) VALUES
(1, 'admin', 321, 'Administrador'),
(2, 'JDW', 567, 'Estudiante'),
(7, 'LOL', 345, 'Estudiante'),
(8, 'Marta', 567, 'Estudiante'),
(11, 'gh', 567, 'Docente'),
(12, 'hd', 345, 'Docente'),
(18, 'lok', 567, 'Coordinador'),
(19, 'jaag', 2309, 'Estudiante'),
(20, 'LINA19', 135, 'Docente'),
(21, 'TIGRE SALVAJE', 987, 'Docente'),
(22, 'min_', 6789, 'Coordinador'),
(23, 'lely', 876, 'Estudiante'),
(24, 'pedrob', 745, 'Docente'),
(25, 'pthp', 2098, 'Docente'),
(26, 'daac09', 878, 'Estudiante');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coordinadores`
--
ALTER TABLE `coordinadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usercoor` (`id_user`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area` (`area`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_userpro` (`id_user`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id_pro`),
  ADD KEY `id_eva` (`id_pro_eva`),
  ADD KEY `id_dir` (`id_pro_dir`),
  ADD KEY `linea` (`linea_invg`),
  ADD KEY `id_est` (`id_est`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coordinadores`
--
ALTER TABLE `coordinadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `linea_investigacion`
--
ALTER TABLE `linea_investigacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coordinadores`
--
ALTER TABLE `coordinadores`
  ADD CONSTRAINT `id_usercoor` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `id_userpro` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `id_dir` FOREIGN KEY (`id_pro_dir`) REFERENCES `profesores` (`id`),
  ADD CONSTRAINT `id_est` FOREIGN KEY (`id_est`) REFERENCES `estudiantes` (`id`),
  ADD CONSTRAINT `id_eva` FOREIGN KEY (`id_pro_eva`) REFERENCES `profesores` (`id`),
  ADD CONSTRAINT `linea` FOREIGN KEY (`linea_invg`) REFERENCES `linea_investigacion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
