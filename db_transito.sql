-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2021 a las 03:02:49
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_transito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_agente`
--

CREATE TABLE `tb_agente` (
  `nombre` varchar(50) DEFAULT NULL,
  `codigo` varchar(10) NOT NULL,
  `anos_exp` decimal(10,1) NOT NULL,
  `codigo_sec` decimal(10,1) NOT NULL,
  `via_act` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_agente`
--

INSERT INTO `tb_agente` (`nombre`, `codigo`, `anos_exp`, `codigo_sec`, `via_act`) VALUES
('Juan Estevan Rejifo', '2CT4BT', '2.0', '1.0', 3),
('Maria', '2E4F2C', '3.6', '245.0', 1),
('Kevin Stiven', '2FA6R', '3.0', '451.0', 1),
('Fernando', 'GFERER45', '3.0', '3787.0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_via`
--

CREATE TABLE `tb_via` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `tipo_via` varchar(20) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `nivel` double(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_via`
--

INSERT INTO `tb_via` (`id`, `tipo`, `tipo_via`, `numero`, `nivel`) VALUES
(1, 'Carreteta Principal', 'Calle', 40, 40),
(3, 'Autopista', 'Carreteta', 20, 60),
(4, 'Carreteta Principal', 'Calle', 800, 100),
(5, 'Autopista', 'Carreteta', 24, 20),
(8, 'Carreteta Seundaria', 'Carreteta', 9, 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_agente`
--
ALTER TABLE `tb_agente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `via_act` (`via_act`);

--
-- Indices de la tabla `tb_via`
--
ALTER TABLE `tb_via`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_via`
--
ALTER TABLE `tb_via`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_agente`
--
ALTER TABLE `tb_agente`
  ADD CONSTRAINT `tb_agente_ibfk_1` FOREIGN KEY (`via_act`) REFERENCES `tb_via` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
