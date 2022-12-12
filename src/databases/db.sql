-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-12-2021 a las 21:57:50
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apilansanet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antena_info`
--

CREATE TABLE `antena_info` (
  `id_antena` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_tipo_antena` int(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `id_ip_antena` int(10) NOT NULL,
  `id_sectorial` int(10) NOT NULL,
  `backup_antena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `antena_info`
--

INSERT INTO `antena_info` (`id_antena`, `nombre`, `id_tipo_antena`, `user`, `pass`, `id_ip_antena`, `id_sectorial`, `backup_antena`) VALUES
(1, 'Prueba', 1, 'Prueba', 'Prueba', 1, 1, 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` bigint(12) NOT NULL,
  `img_cedula` varchar(120) NOT NULL,
  `barrio` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `mail` varchar(60) NOT NULL,
  `num_tel` bigint(11) NOT NULL,
  `pago` int(7) NOT NULL,
  `id_fecha_user` int(10) NOT NULL,
  `num_megas` int(3) NOT NULL,
  `info_tipo_red` int(10) NOT NULL,
  `id_info_router` int(10) NOT NULL,
  `estado` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `cedula`, `img_cedula`, `barrio`, `direccion`, `mail`, `num_tel`, `pago`, `id_fecha_user`, `num_megas`, `info_tipo_red`, `id_info_router`, `estado`) VALUES
(3, 'Prueba', 'Prueba', 1072744262, 'none.png', 'Prueba', 'Prueba', 'Prueba', 3224338072, 100000, 1, 0, 1, 1, 'Activo'),
(62, 'Zoraida', 'Triana', 123121, '___IMAGE_LANSANET___50262910202182901292501.jpg', 'Centro', 'Nose', 'zora@gmail.com', 1231231, 12, 130, 12, 129, 129, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha_user`
--

CREATE TABLE `fecha_user` (
  `id_fecha_user` int(10) NOT NULL,
  `fecha_insta` date NOT NULL,
  `dia_pago` int(2) NOT NULL,
  `fecha_suspen` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fecha_user`
--

INSERT INTO `fecha_user` (`id_fecha_user`, `fecha_insta`, `dia_pago`, `fecha_suspen`) VALUES
(1, '0000-00-00', 1, '0000-00-00'),
(130, '2021-10-07', 12, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_router`
--

CREATE TABLE `info_router` (
  `id_info_router` int(10) NOT NULL,
  `id_tipo_router` int(10) NOT NULL,
  `id_ip_entrada` int(10) NOT NULL,
  `user_router` varchar(50) NOT NULL,
  `pass_router` varchar(50) NOT NULL,
  `ssid` varchar(50) NOT NULL,
  `contra` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `info_router`
--

INSERT INTO `info_router` (`id_info_router`, `id_tipo_router`, `id_ip_entrada`, `user_router`, `pass_router`, `ssid`, `contra`) VALUES
(1, 1, 1, 'Prueba', 'Prueba', 'Prueba', 'Prueba'),
(129, 1, 269, 'admin', 'admin', 'asdasd', 'asdasd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_tipo_red`
--

CREATE TABLE `info_tipo_red` (
  `id_info_tipo_red` int(10) NOT NULL,
  `id_ip` int(10) DEFAULT NULL,
  `id_pppoe` int(10) DEFAULT NULL,
  `id_antena` int(10) DEFAULT NULL,
  `id_red` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `info_tipo_red`
--

INSERT INTO `info_tipo_red` (`id_info_tipo_red`, `id_ip`, `id_pppoe`, `id_antena`, `id_red`) VALUES
(1, 1, 1, 1, 1),
(129, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ip_info`
--

CREATE TABLE `ip_info` (
  `id_ip_info` int(10) NOT NULL,
  `seg_uno` smallint(3) NOT NULL,
  `seg_dos` smallint(3) NOT NULL,
  `seg_tres` smallint(3) NOT NULL,
  `seg_cuatro` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ip_info`
--

INSERT INTO `ip_info` (`id_ip_info`, `seg_uno`, `seg_dos`, `seg_tres`, `seg_cuatro`) VALUES
(1, 0, 0, 0, 0),
(268, 123, 12, 12, 12),
(269, 12, 12, 12, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pppoe_info`
--

CREATE TABLE `pppoe_info` (
  `id_pppoe` int(10) NOT NULL,
  `user_pppoe` varchar(50) NOT NULL,
  `pass_pppoe` varchar(50) NOT NULL,
  `id_ip_pppoe` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pppoe_info`
--

INSERT INTO `pppoe_info` (`id_pppoe`, `user_pppoe`, `pass_pppoe`, `id_ip_pppoe`) VALUES
(1, 'Prueba', 'Prueba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_info`
--

CREATE TABLE `red_info` (
  `id_red` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `backup` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `red_info`
--

INSERT INTO `red_info` (`id_red`, `nombre`, `ubicacion`, `backup`) VALUES
(1, 'Prueba_1', 'Prueba', 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(3) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(1, 'admin', 'Es el Administrador General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectorial_info`
--

CREATE TABLE `sectorial_info` (
  `id_sectorial` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_tipo_antena` int(10) NOT NULL,
  `ssid` varchar(50) NOT NULL,
  `contra` varchar(50) NOT NULL,
  `id_ip_sectorial` int(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `frecuencia` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sectorial_info`
--

INSERT INTO `sectorial_info` (`id_sectorial`, `nombre`, `id_tipo_antena`, `ssid`, `contra`, `id_ip_sectorial`, `user`, `pass`, `frecuencia`) VALUES
(1, 'None', 1, 'None', 'None', 1, 'None', 'None', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_antena`
--

CREATE TABLE `tipo_antena` (
  `id_tipo_antena` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `miniatura` varchar(50) NOT NULL,
  `precio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_antena`
--

INSERT INTO `tipo_antena` (`id_tipo_antena`, `nombre`, `marca`, `miniatura`, `precio`) VALUES
(1, 'None', 'None', '--/--', 0),
(2, 'LiteBeam M5 Gen2', 'Ubiquiti', '--/--', 220000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_router`
--

CREATE TABLE `tipo_router` (
  `id_tipo_router` int(10) NOT NULL,
  `nombre_router` varchar(50) NOT NULL,
  `miniatura` varchar(100) NOT NULL,
  `precio` int(10) NOT NULL,
  `id_ip_defecto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_router`
--

INSERT INTO `tipo_router` (`id_tipo_router`, `nombre_router`, `miniatura`, `precio`, `id_ip_defecto`) VALUES
(1, 'Prueba', 'Prueba', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(3) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contra` varchar(75) NOT NULL,
  `id_rol` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `usuario`, `contra`, `id_rol`, `nombre`, `apellido`) VALUES
(1, 'admin', 'admin', 1, 'Juan', 'Triana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `antena_info`
--
ALTER TABLE `antena_info`
  ADD PRIMARY KEY (`id_antena`),
  ADD KEY `fk_id_tipo_antena` (`id_tipo_antena`) USING BTREE,
  ADD KEY `fk_id_sectorial` (`id_sectorial`) USING BTREE,
  ADD KEY `fk_id_ip_antena` (`id_ip_antena`) USING BTREE;

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`) USING BTREE,
  ADD KEY `fk_id_fecha_user` (`id_fecha_user`),
  ADD KEY `fk_info_router` (`id_info_router`),
  ADD KEY `fk_info_tipo_red` (`info_tipo_red`);

--
-- Indices de la tabla `fecha_user`
--
ALTER TABLE `fecha_user`
  ADD PRIMARY KEY (`id_fecha_user`);

--
-- Indices de la tabla `info_router`
--
ALTER TABLE `info_router`
  ADD PRIMARY KEY (`id_info_router`),
  ADD KEY `fk_id_tipo_router` (`id_tipo_router`),
  ADD KEY `fk_id_tipo_entrada` (`id_ip_entrada`);

--
-- Indices de la tabla `info_tipo_red`
--
ALTER TABLE `info_tipo_red`
  ADD PRIMARY KEY (`id_info_tipo_red`) USING BTREE,
  ADD KEY `fk_id_ip` (`id_ip`),
  ADD KEY `fk_id_pppoe` (`id_pppoe`),
  ADD KEY `fk_id_antena` (`id_antena`),
  ADD KEY `fk_id_red` (`id_red`);

--
-- Indices de la tabla `ip_info`
--
ALTER TABLE `ip_info`
  ADD PRIMARY KEY (`id_ip_info`);

--
-- Indices de la tabla `pppoe_info`
--
ALTER TABLE `pppoe_info`
  ADD PRIMARY KEY (`id_pppoe`),
  ADD KEY `fk_id_ip` (`id_ip_pppoe`);

--
-- Indices de la tabla `red_info`
--
ALTER TABLE `red_info`
  ADD PRIMARY KEY (`id_red`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sectorial_info`
--
ALTER TABLE `sectorial_info`
  ADD PRIMARY KEY (`id_sectorial`),
  ADD KEY `fk_id_tipo_antena` (`id_tipo_antena`),
  ADD KEY `fk_id_ip_sectorial` (`id_ip_sectorial`);

--
-- Indices de la tabla `tipo_antena`
--
ALTER TABLE `tipo_antena`
  ADD PRIMARY KEY (`id_tipo_antena`);

--
-- Indices de la tabla `tipo_router`
--
ALTER TABLE `tipo_router`
  ADD PRIMARY KEY (`id_tipo_router`),
  ADD KEY `id_tipo_router` (`id_ip_defecto`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_rol` (`id_rol`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `antena_info`
--
ALTER TABLE `antena_info`
  MODIFY `id_antena` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `fecha_user`
--
ALTER TABLE `fecha_user`
  MODIFY `id_fecha_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `info_router`
--
ALTER TABLE `info_router`
  MODIFY `id_info_router` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT de la tabla `info_tipo_red`
--
ALTER TABLE `info_tipo_red`
  MODIFY `id_info_tipo_red` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT de la tabla `ip_info`
--
ALTER TABLE `ip_info`
  MODIFY `id_ip_info` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT de la tabla `pppoe_info`
--
ALTER TABLE `pppoe_info`
  MODIFY `id_pppoe` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `red_info`
--
ALTER TABLE `red_info`
  MODIFY `id_red` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sectorial_info`
--
ALTER TABLE `sectorial_info`
  MODIFY `id_sectorial` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_antena`
--
ALTER TABLE `tipo_antena`
  MODIFY `id_tipo_antena` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_router`
--
ALTER TABLE `tipo_router`
  MODIFY `id_tipo_router` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antena_info`
--
ALTER TABLE `antena_info`
  ADD CONSTRAINT `antena_info_ibfk_2` FOREIGN KEY (`id_sectorial`) REFERENCES `sectorial_info` (`id_sectorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antena_info_ibfk_3` FOREIGN KEY (`id_tipo_antena`) REFERENCES `tipo_antena` (`id_tipo_antena`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antena_info_ibfk_4` FOREIGN KEY (`id_ip_antena`) REFERENCES `ip_info` (`id_ip_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_fecha_user`) REFERENCES `fecha_user` (`id_fecha_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`id_info_router`) REFERENCES `info_router` (`id_info_router`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`info_tipo_red`) REFERENCES `info_tipo_red` (`id_info_tipo_red`);

--
-- Filtros para la tabla `info_router`
--
ALTER TABLE `info_router`
  ADD CONSTRAINT `info_router_ibfk_1` FOREIGN KEY (`id_tipo_router`) REFERENCES `tipo_router` (`id_tipo_router`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `info_router_ibfk_2` FOREIGN KEY (`id_ip_entrada`) REFERENCES `ip_info` (`id_ip_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `info_tipo_red`
--
ALTER TABLE `info_tipo_red`
  ADD CONSTRAINT `info_tipo_red_ibfk_2` FOREIGN KEY (`id_ip`) REFERENCES `ip_info` (`id_ip_info`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `info_tipo_red_ibfk_4` FOREIGN KEY (`id_pppoe`) REFERENCES `pppoe_info` (`id_pppoe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `info_tipo_red_ibfk_5` FOREIGN KEY (`id_antena`) REFERENCES `antena_info` (`id_antena`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `info_tipo_red_ibfk_6` FOREIGN KEY (`id_red`) REFERENCES `red_info` (`id_red`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pppoe_info`
--
ALTER TABLE `pppoe_info`
  ADD CONSTRAINT `pppoe_info_ibfk_1` FOREIGN KEY (`id_ip_pppoe`) REFERENCES `ip_info` (`id_ip_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sectorial_info`
--
ALTER TABLE `sectorial_info`
  ADD CONSTRAINT `sectorial_info_ibfk_1` FOREIGN KEY (`id_tipo_antena`) REFERENCES `tipo_antena` (`id_tipo_antena`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sectorial_info_ibfk_2` FOREIGN KEY (`id_ip_sectorial`) REFERENCES `ip_info` (`id_ip_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_router`
--
ALTER TABLE `tipo_router`
  ADD CONSTRAINT `tipo_router_ibfk_1` FOREIGN KEY (`id_ip_defecto`) REFERENCES `ip_info` (`id_ip_info`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
