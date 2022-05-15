-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-05-2022 a las 01:03:24
-- Versión del servidor: 10.3.22-MariaDB-log
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `378738`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Canton`
--

CREATE TABLE `Canton` (
  `canton_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Curso`
--

CREATE TABLE `Curso` (
  `curso_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `grupo_FK` int(11) DEFAULT NULL,
  `escuela_FK` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Direccion`
--

CREATE TABLE `Direccion` (
  `direccion_PK` int(11) NOT NULL,
  `direccion_exacta` varchar(50) DEFAULT NULL,
  `provinciaFK` int(11) DEFAULT NULL,
  `cantonFK` int(11) DEFAULT NULL,
  `distritoFK` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Distrito`
--

CREATE TABLE `Distrito` (
  `distrito_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Escuela`
--

CREATE TABLE `Escuela` (
  `escuela_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `prefijo` varchar(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EstudiantesCartago`
--

CREATE TABLE `EstudiantesCartago` (
  `estudiantes_cartago_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `contrasenna` varchar(50) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `persona_FK` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Grupo`
--

CREATE TABLE `Grupo` (
  `grupo_PK` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MatriculaxEstudiante`
--

CREATE TABLE `MatriculaxEstudiante` (
  `MatriculaxEstudiantePK` int(11) NOT NULL,
  `curso_FK` int(11) DEFAULT NULL,
  `estudiante_FK` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

CREATE TABLE `Persona` (
  `persona_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `cedula` varchar(50) DEFAULT NULL,
  `direccion_FK` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Provincia`
--

CREATE TABLE `Provincia` (
  `provincia_PK` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Canton`
--
ALTER TABLE `Canton`
  ADD PRIMARY KEY (`canton_PK`);

--
-- Indices de la tabla `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`curso_PK`),
  ADD KEY `escuela_FK` (`escuela_FK`),
  ADD KEY `grupo_FK` (`grupo_FK`);

--
-- Indices de la tabla `Direccion`
--
ALTER TABLE `Direccion`
  ADD PRIMARY KEY (`direccion_PK`),
  ADD KEY `provinciaFK` (`provinciaFK`),
  ADD KEY `cantonFK` (`cantonFK`),
  ADD KEY `distritoFK` (`distritoFK`);

--
-- Indices de la tabla `Distrito`
--
ALTER TABLE `Distrito`
  ADD PRIMARY KEY (`distrito_PK`);

--
-- Indices de la tabla `Escuela`
--
ALTER TABLE `Escuela`
  ADD PRIMARY KEY (`escuela_PK`);

--
-- Indices de la tabla `EstudiantesCartago`
--
ALTER TABLE `EstudiantesCartago`
  ADD PRIMARY KEY (`estudiantes_cartago_PK`),
  ADD KEY `persona_FK` (`persona_FK`);

--
-- Indices de la tabla `Grupo`
--
ALTER TABLE `Grupo`
  ADD PRIMARY KEY (`grupo_PK`);

--
-- Indices de la tabla `MatriculaxEstudiante`
--
ALTER TABLE `MatriculaxEstudiante`
  ADD PRIMARY KEY (`MatriculaxEstudiantePK`),
  ADD KEY `estudiante_FK` (`estudiante_FK`),
  ADD KEY `curso_FK` (`curso_FK`);

--
-- Indices de la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`persona_PK`),
  ADD KEY `direccion_FK` (`direccion_FK`);

--
-- Indices de la tabla `Provincia`
--
ALTER TABLE `Provincia`
  ADD PRIMARY KEY (`provincia_PK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
