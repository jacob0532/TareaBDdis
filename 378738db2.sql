-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-05-2022 a las 01:10:00
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
-- Base de datos: `378738db2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `montoPagado` decimal(10,0) DEFAULT NULL,
  `totalAPagar` decimal(10,0) DEFAULT NULL,
  `diferencia` decimal(10,0) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `iva` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `id` int(11) NOT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `idSancion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MultaXPersona`
--

CREATE TABLE `MultaXPersona` (
  `id` int(11) NOT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `idMultaFK` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idFactura` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `MultaXPersona`
--
ALTER TABLE `MultaXPersona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMultaFK` (`idMultaFK`),
  ADD KEY `idFactura` (`idFactura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
