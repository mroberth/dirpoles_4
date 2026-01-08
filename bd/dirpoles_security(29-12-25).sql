-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-12-2025 a las 16:53:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dirpoles_security`
--
CREATE DATABASE IF NOT EXISTS `dirpoles_security` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `dirpoles_security`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `accion` enum('Registro','Lectura','Actualización','Eliminación','Inicio de sesión','Cierre de sesión') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id_bitacora`, `id_empleado`, `modulo`, `accion`, `descripcion`, `fecha`) VALUES
(1, 1, 'Login', 'Inicio de sesión', 'El empleado Roberth ha iniciado sesión.', '2025-12-24 14:22:31'),
(2, 1, 'Citas', 'Registro', 'El Administrador Roberth registro una cita al empleado:  con el beneficiario:  - ', '2025-12-24 14:23:28'),
(3, 1, 'Citas', 'Registro', 'El Administrador Roberth registro una cita al empleado: Francisco Perez con el beneficiario: V-12999292 - Prueba Prueba', '2025-12-24 14:34:10'),
(4, 1, 'Login', 'Cierre de sesión', 'El empleado Roberth ha cerrado sesión.', '2025-12-24 14:34:28'),
(5, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-24 14:34:35'),
(6, 3, 'Citas', 'Registro', 'El Empleado Juan registro una cita con el beneficiario V-12023051 - Eustaquio Ramirez', '2025-12-24 14:34:55'),
(7, 3, 'Login', 'Cierre de sesión', 'El empleado Juan ha cerrado sesión.', '2025-12-24 14:35:07'),
(8, 1, 'Login', 'Inicio de sesión', 'El empleado Roberth ha iniciado sesión.', '2025-12-24 14:35:15'),
(9, 1, 'Citas', 'Actualización', 'El empleado Roberth actualizó la cita 4 del beneficiario  -  con el empleado Francisco Perez', '2025-12-24 14:41:14'),
(10, 1, 'Citas', 'Actualización', 'El empleado Roberth actualizó la cita de la fecha 2025-12-24 del empleado Francisco Perez con el beneficiario:  - ', '2025-12-24 14:43:44'),
(11, 1, 'Citas', 'Actualización', 'El empleado Roberth actualizó la cita de la fecha 2025-12-24 del empleado Francisco Perez con el beneficiario: V-12999292 - Prueba Prueba', '2025-12-24 14:48:41'),
(12, 1, 'Citas', 'Actualización', 'El empleado Roberth actualizó el estado de la cita 6 a 3', '2025-12-24 15:42:13'),
(13, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-24 21:01:10'),
(14, 3, 'Citas', 'Actualización', 'El empleado Juan actualizó el estado de la cita ID: 3 a Pendiente', '2025-12-24 21:08:07'),
(15, 3, 'Login', 'Cierre de sesión', 'El empleado Juan ha cerrado sesión.', '2025-12-24 21:08:21'),
(16, 1, 'Login', 'Inicio de sesión', 'El empleado Roberth ha iniciado sesión.', '2025-12-24 21:08:28'),
(17, 1, 'Login', 'Cierre de sesión', 'El empleado Roberth ha cerrado sesión.', '2025-12-25 01:09:08'),
(18, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-26 12:51:37'),
(19, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-26 20:54:46'),
(20, 3, 'Login', 'Cierre de sesión', 'El empleado Juan ha cerrado sesión.', '2025-12-26 23:26:19'),
(21, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-27 12:51:37'),
(22, 3, 'Psicologia', 'Registro', 'El Empleado Juan registro un diagnóstico psicológico con el beneficiario Eustaquio Ramirez (V - 12023051)', '2025-12-27 15:28:11'),
(23, 3, 'Login', 'Cierre de sesión', 'El empleado Juan ha cerrado sesión.', '2025-12-27 16:55:12'),
(24, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-27 23:14:53'),
(25, 3, 'Psicologia', 'Registro', 'El Empleado Juan registro un retiro temporal al beneficiario Eustaquio Ramirez (V - 12023051)', '2025-12-27 23:56:34'),
(26, 3, 'Login', 'Cierre de sesión', 'El empleado Juan ha cerrado sesión.', '2025-12-27 23:57:17'),
(27, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-28 21:37:13'),
(28, 3, 'Psicologia', 'Registro', 'El Empleado Juan registro un retiro temporal al beneficiario Prueba Prueba (V - 12999292)', '2025-12-28 22:02:52'),
(29, 3, 'Psicologia', 'Registro', 'El Empleado Juan registro un retiro temporal al beneficiario Eustaquio Ramirez (V - 12023051)', '2025-12-28 22:08:30'),
(30, 3, 'Beneficiarios', 'Actualización', 'Se actualizó el beneficiario: Iris Alvarez (V-12023052)', '2025-12-28 22:08:44'),
(31, 3, 'Beneficiarios', 'Actualización', 'Se actualizó el beneficiario: Eustaquio Ramirez (V-12023051)', '2025-12-28 22:08:51'),
(32, 3, 'Citas', 'Actualización', 'El empleado Juan actualizó el estado de la cita ID: 3 a Confirmada', '2025-12-28 22:09:08'),
(33, 3, 'Psicologia', 'Registro', 'El Empleado Juan registro un cambio de carrera al beneficiario Iris Alvarez (V - 12023052)', '2025-12-28 23:05:05'),
(34, 3, 'Psicologia', 'Registro', 'El Empleado Juan registro un diagnóstico psicológico con el beneficiario Iris Alvarez (V - 12023052)', '2025-12-29 00:49:21'),
(35, 3, 'Login', 'Cierre de sesión', 'El empleado Juan ha cerrado sesión.', '2025-12-29 01:06:57'),
(36, 24, 'Login', 'Inicio de sesión', 'El empleado Francisco ha iniciado sesión.', '2025-12-29 01:07:06'),
(37, 24, 'Login', 'Cierre de sesión', 'El empleado Francisco ha cerrado sesión.', '2025-12-29 01:07:20'),
(38, 3, 'Login', 'Inicio de sesión', 'El empleado Juan ha iniciado sesión.', '2025-12-29 13:12:26'),
(39, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Diagnóstico', '2025-12-29 15:29:48'),
(40, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Diagnóstico', '2025-12-29 15:30:41'),
(41, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Cambio de carrera', '2025-12-29 15:33:02'),
(42, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Retiro temporal', '2025-12-29 15:33:18'),
(43, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Diagnóstico', '2025-12-29 15:37:00'),
(44, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Retiro temporal', '2025-12-29 15:37:09'),
(45, 3, 'Psicologia', 'Actualización', 'El Empleado Juan actualizó un diagnóstico de tipo Cambio de carrera', '2025-12-29 15:37:24'),
(46, 3, 'Psicologia', 'Eliminación', 'El Empleado Juan eliminó un diagnóstico', '2025-12-29 15:52:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `tipo_cedula` varchar(1) DEFAULT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `id_tipo_empleado` int(1) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` mediumtext DEFAULT NULL,
  `clave` varchar(65) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `tipo_cedula`, `cedula`, `correo`, `telefono`, `id_tipo_empleado`, `fecha_nacimiento`, `direccion`, `clave`, `estatus`, `fecha_creacion`) VALUES
(1, 'Roberth', 'Matos', 'V', '28281433', 'admin@gmail.com', '04129298008', 6, '2002-04-05', 'Calle 54 con avenida 13', '$2y$10$I7kpYQ.Cju5KWqNkz.VdQ.Pg3PXIKmG./kuCiqMv78c516KPUd7Lq', 1, '2025-04-17'),
(2, 'Roberth', 'Matos', 'V', '00000000', 'superusuario@gmail.com', '04120000000', 10, '2000-01-01', 'Barquisimeto', '$2y$10$tGVkt2cNpsT6TzaoKeFQWOlI72P/EjuFWHc3bvWUNtUbdKi2etQKK', 1, '2025-11-11'),
(3, 'Juan', 'Hernandez', 'V', '10999854', 'psicologo@gmail.com', '04161233211', 1, '1994-12-12', 'Barquisimeto', '$2y$10$0WPRA3Y2y.J7OeRAyjrSf.DJwDxo89bkJ21W13svn4FrBxt1ZtkJe', 1, '2025-11-12'),
(4, 'Fernando', 'Batipsta', 'V', '9625664', 'chofer@gmail.com', '04169421243', 8, '1990-08-05', 'Calle 10 de pueblo nuevo', '$2y$10$ef0sexMYOmmRFhu0I0382.p60XRMargX3ggkdH1l179D9HgIkzDtG', 1, '2025-11-13'),
(5, 'Blairismar', 'Mendez', 'V', '9654655', 'medicina@gmail.com', '04141233215', 2, '2004-07-18', 'Av. Carabobo, barquisimeto', '$2y$10$CurHsm.5B.ANIAaYZ9cfhuptVlI41EUJJZb0PO9nt1nEjiex0mzdi', 1, '2025-11-15'),
(6, 'Francisco', 'Tamayo', 'V', '12335445', 'trabajadorsocial@gmail.com', '04261234443', 3, '2000-01-12', 'calle 1 barquisimeto', '$2y$10$87sRL2TdIOWJFiRcw0k36OnW2BBidkz2XELskxB8lsObSLPZ4DN42', 1, '2025-11-15'),
(7, 'Victor', 'Reyes', 'V', '6545885', 'orientador@gmail.com', '04244993431', 4, '2000-01-01', 'Calle 2 de pueblo nuevo', '$2y$10$6rEs0Ie8GIe2pv.RKXAFyuykXAuMwLikoYZImp3IceOlCBx6ZM.Fi', 1, '2025-11-15'),
(8, 'Alejandra', 'Andara', 'V', '15442225', 'discapacidad@gmail.com', '04160002155', 5, '2002-02-02', 'Calle 55 con carrera 14', '$2y$10$zSqXRFp9l1wVUkLXYh/O.O94fiE98cxprc1zrHPODyrm0Y9.HBb0W', 1, '2025-11-15'),
(9, 'Empleado', 'Prueba', 'E', '90854856', 'empleado@gmail.com', '04169994433', 11, '2000-01-01', 'Calle 10 de pueblo nuevo', '$2y$10$T4.UVJCxh3DNxI0pJoB/juf9JqDnOb1ZfSlZUj0ihJ4BJ/7kwqh/q', 1, '2025-12-07'),
(10, 'Gustavo', 'Suarez', 'V', '12935654', 'gustavo@gmail.com', '04264342222', 11, '2000-01-01', 'Calle 1', '$2y$10$gKK/WsfwOHSdFm155jZc3unpdvaK/0HTXJVLjFyDMJ8c58AasmBWS', 1, '2025-12-07'),
(11, 'Ricardo', 'Torrealba', 'V', '32445998', 'torrealba@gmail.es', '04262134888', 5, '2000-12-12', 'Calle 1', '$2y$10$fjx0NpjMuNVGkx31Rt0wEOW9xQmlkE46ZQlnxMGgmmVPYKgCVTBj.', 1, '2025-12-08'),
(12, 'Juan', 'Torrealba', 'V', '35445666', 'juan@gmail.com', '04169943888', 4, '2000-12-12', 'Calle 1', '$2y$10$MKvMGrSGTBmON7vadUcvRenlChu0GKLThsrVWGyCH1W06kw8jlF3K', 1, '2025-12-08'),
(13, 'Mariaalejandra', 'Tovar', 'V', '23495999', 'alejandra@gmail.com', '04169948378', 3, '2000-12-12', 'Calle', '$2y$10$tZgyaI00qw988gjXaQwPTe8c7nkMK5PSwZXmWaM8ZbfO9rwT6fyAW', 1, '2025-12-08'),
(14, 'Rafael', 'Caldera', 'E', '80441225', 'caldera@gmail.com', '04169293842', 4, '2000-12-12', 'Calle 1', '$2y$10$6qva/2HoSqIg7c/n1OzBbu1iJkAAr3TrSHOQcMWeIZBc4bX7i6jfC', 1, '2025-12-08'),
(15, 'Juan', 'Ramirez', 'V', '1244555', 'ramirez@gmail.com', '04169239282', 4, '2000-12-12', 'Calle 10', '$2y$10$qkQh7Z8ytKFAbSdRE/ipWOTVxviSDu9VYRjMkFelVoxolxAXpdCN2', 1, '2025-12-08'),
(16, 'Alberto', 'Hernandez', 'V', '25544455', 'alberto@gmail.com', '04169292444', 4, '2000-12-12', 'Calle 10 de pueblo nuevo', '$2y$10$l5T/xBhyBPzSvlArVq.vzO8zsJBUDosQskDUb2mnz68V20VX1wRIu', 1, '2025-12-08'),
(17, 'Jesus', 'Torres', 'V', '19113555', 'jesus@gmail.es', '04169422233', 4, '2000-04-01', 'Calle 1', '$2y$10$Wcx5fAvGGIj07FsiveRM2eOEcrgou8Tmwyte.dXUZAB3Y84b488Hi', 1, '2025-12-08'),
(18, 'Daniela', 'Zabala', 'V', '21412555', 'danielzab@gmail.com', '04169239247', 11, '2000-05-08', 'Calle 10', '$2y$10$iIkI7WwJ0rl3sKGbjeuPGuA7Rmx4KrpbOowE/lhI4fQ4wOmhf00F6', 1, '2025-12-08'),
(19, 'Jose', 'Rodriguez', 'V', '12344399', 'jose@gmail.com', '04169239213', 5, '2000-12-12', 'Calle 10', '$2y$10$OrFvSRta0fRqmxyqU97/iOddBH73anbYeSvwzQHd6/Jd.DsYGpZi.', 1, '2025-12-08'),
(20, 'Empleado', 'Prueba', 'V', '34445445', 'prueba@gmail.com', '04169290912', 5, '2000-12-12', 'Calle 10', '$2y$10$V60jJVv4VuqDBy9RwFiKTuZqMwqS2O0J3E8763kQnf6GTw7xB5nmW', 1, '2025-12-09'),
(21, 'Prueba', 'Prueba', 'V', '45745141', 'pruebas@gmail.com', '04141232412', 5, '2000-12-12', 'Calle', '$2y$10$uzyTGkIPUsUlxlEJHZBcJOtDdt0O2LIqxtXFppQdEJAoNNK3P8RMC', 1, '2025-12-09'),
(24, 'Francisco', 'Perez', 'V', '30991992', 'psicologo_2@gmail.com', '04169998811', 1, '1994-01-01', 'Barquisimeto', '$2y$10$.6UvSI5s/8kmRw8eKv7QNeEQ7nX.ZlGB.paOHWOmcJX2no.i2alz2', 1, '2025-12-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `nombre`, `descripcion`) VALUES
(1, 'Empleados', 'Gestionar Empleados'),
(2, 'Beneficiarios', 'Gestionar Beneficiarios'),
(3, 'Citas', 'Gestionar Citas'),
(4, 'Psicologia', 'Diagnosticos de Psicologia'),
(5, 'Medicina', 'Diagnosticos de Medicina'),
(6, 'Orientacion', 'Diagnosticos de Orientacion'),
(7, 'Trabajador Social', 'Diagnosticos de Trabajador Social'),
(8, 'Discapacidad', 'Diagnosticos de Discapacidad'),
(9, 'Inventario Medico', 'Gestionar Inventario Medico'),
(10, 'Referencias', 'Gestionar Referencias'),
(11, 'Jornadas', 'Gestionar Jornadas'),
(12, 'Mobiliario', 'Gestionar Mobiliario'),
(13, 'Transporte', 'Gestionar Transporte'),
(14, 'Configuracion', 'Gestionar Configuracion'),
(15, 'Reportes', 'Gestionar Reportes'),
(16, 'Bitacora', 'Gestionar Bitacora'),
(17, 'Permisos', 'Gestionar Permisos de Usuario'),
(18, 'Horarios', 'Gestionar Horarios para empleados de Psicología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificaciones` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id_notificaciones`, `titulo`, `url`, `tipo`, `fecha_creacion`) VALUES
(1, 'Registro de empleado', 'empleados_consulta', 'empleado', '2025-12-09 18:18:15'),
(2, 'Registro de empleado', 'empleados_consulta', 'empleado', '2025-12-09 18:19:13'),
(3, 'Registro de empleado', 'empleados_consulta', 'empleado', '2025-12-09 18:31:37'),
(4, 'Registro de empleado', 'empleados_consulta', 'empleado', '2025-12-09 18:32:34'),
(5, 'Eliminación de empleado', 'consultar_empleados', 'empleado', '2025-12-09 18:41:01'),
(6, 'Eliminación de empleado', 'consultar_empleados', 'empleado', '2025-12-09 18:41:06'),
(7, 'Actualización de empleado', 'consultar_empleados', 'empleado', '2025-12-09 18:41:34'),
(8, 'Registro de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-10 01:30:28'),
(9, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-10 17:24:26'),
(10, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-10 17:29:52'),
(11, 'Eliminación de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-11 16:45:46'),
(12, 'Registro de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-11 16:48:55'),
(13, 'Eliminación de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-11 16:49:33'),
(14, 'Registro de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-12 00:05:10'),
(15, 'Eliminación de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-12 00:05:21'),
(16, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:14:52'),
(17, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:17:09'),
(18, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:18:29'),
(19, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:33:34'),
(20, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:35:21'),
(21, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:41:09'),
(22, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 15:41:30'),
(23, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 16:45:06'),
(24, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-13 19:24:19'),
(25, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 14:40:40'),
(26, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 14:42:17'),
(27, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 14:42:31'),
(28, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 16:05:32'),
(29, 'Registro de empleado', 'consultar_empleados', 'empleado', '2025-12-14 20:23:41'),
(30, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 20:24:30'),
(31, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 23:13:26'),
(32, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 23:13:55'),
(33, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-14 23:21:26'),
(34, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-15 17:21:13'),
(35, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-15 17:21:25'),
(36, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-15 17:22:00'),
(37, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-15 17:22:14'),
(38, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-15 17:57:07'),
(39, 'Registro de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-21 22:09:41'),
(40, 'Actualización de horario', 'consultar_horarios', 'horario', '2025-12-21 22:12:16'),
(41, 'Eliminación de horario', 'consultar_horarios', 'horario', '2025-12-21 22:17:55'),
(42, 'Registro de horario', 'consultar_horarios', 'horario', '2025-12-21 22:19:06'),
(43, 'Registro de horario', 'consultar_horarios', 'horario', '2025-12-21 22:41:02'),
(44, 'Registro de horario', 'consultar_horarios', 'horario', '2025-12-21 22:48:56'),
(45, 'Registro de horario', 'consultar_horarios', 'horario', '2025-12-21 22:49:56'),
(46, 'Registro de horario', 'consultar_horarios', 'horario', '2025-12-21 22:50:10'),
(47, 'Registro de horario', 'consultar_horarios', 'horario', '2025-12-21 22:55:33'),
(48, 'Actualización de horario', 'consultar_horarios', 'horario', '2025-12-22 16:24:46'),
(49, 'Eliminación de horario', 'consultar_horarios', 'horario', '2025-12-22 16:25:12'),
(50, 'Actualización de horario', 'consultar_horarios', 'horario', '2025-12-22 16:26:04'),
(51, 'Actualización de horario', 'consultar_horarios', 'horario', '2025-12-22 16:26:10'),
(52, 'Actualización de horario', 'consultar_horarios', 'horario', '2025-12-22 16:26:35'),
(53, 'Eliminación de horario', 'consultar_horarios', 'horario', '2025-12-22 16:26:56'),
(54, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-23 15:29:24'),
(55, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-23 16:37:19'),
(56, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-23 16:54:11'),
(57, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-23 17:02:51'),
(58, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-23 17:03:05'),
(59, 'Eliminación de cita', 'consultar_citas', 'cita', '2025-12-23 17:06:13'),
(60, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-23 17:07:58'),
(61, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-23 17:08:07'),
(62, 'Eliminación de cita', 'consultar_citas', 'cita', '2025-12-23 17:08:16'),
(63, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-23 17:19:48'),
(64, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-24 14:23:28'),
(65, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-24 14:34:10'),
(66, 'Registro de cita', 'consultar_citas', 'cita', '2025-12-24 14:34:55'),
(67, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-24 14:41:14'),
(68, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-24 14:43:44'),
(69, 'Actualización de cita', 'consultar_citas', 'cita', '2025-12-24 14:48:41'),
(70, 'Registro de diagnóstico', 'consultar_citas', 'diagnostico', '2025-12-27 15:28:11'),
(71, 'Registro de retiro temporal', 'consultar_citas', 'diagnostico', '2025-12-27 23:56:34'),
(72, 'Registro de retiro temporal', 'consultar_citas', 'diagnostico', '2025-12-28 22:02:52'),
(73, 'Registro de retiro temporal', 'consultar_citas', 'diagnostico', '2025-12-28 22:08:30'),
(74, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-28 22:08:44'),
(75, 'Actualización de beneficiario', 'consultar_beneficiarios', 'beneficiario', '2025-12-28 22:08:51'),
(76, 'Registro de cambio de carrera', 'consultar_citas', 'diagnostico', '2025-12-28 23:05:05'),
(77, 'Registro de diagnóstico', 'consultar_citas', 'diagnostico', '2025-12-29 00:49:21'),
(78, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:29:48'),
(79, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:30:41'),
(80, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:33:02'),
(81, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:33:18'),
(82, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:37:00'),
(83, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:37:09'),
(84, 'Actualización de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:37:24'),
(85, 'Eliminación de diagnóstico', 'diagnostico_psicologia_consultar', 'diagnostico', '2025-12-29 15:52:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_empleados`
--

CREATE TABLE `notificaciones_empleados` (
  `id_notificaciones_empleados` int(11) NOT NULL,
  `id_notificaciones` int(11) NOT NULL,
  `id_emisor` int(11) NOT NULL,
  `id_receptor` int(11) NOT NULL,
  `leido` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `notificaciones_empleados`
--

INSERT INTO `notificaciones_empleados` (`id_notificaciones_empleados`, `id_notificaciones`, `id_emisor`, `id_receptor`, `leido`) VALUES
(1, 1, 2, 1, 1),
(2, 2, 2, 1, 1),
(3, 3, 2, 1, 1),
(4, 4, 2, 1, 1),
(5, 5, 2, 1, 1),
(6, 6, 2, 1, 1),
(7, 7, 2, 1, 1),
(8, 8, 1, 1, 1),
(9, 9, 1, 1, 1),
(10, 10, 1, 1, 1),
(11, 11, 1, 1, 1),
(12, 12, 1, 1, 1),
(13, 13, 1, 1, 1),
(14, 14, 1, 1, 1),
(15, 15, 1, 1, 1),
(16, 16, 1, 1, 1),
(17, 17, 1, 1, 1),
(18, 18, 1, 1, 1),
(19, 19, 1, 1, 1),
(20, 20, 1, 1, 1),
(21, 21, 1, 1, 1),
(22, 22, 1, 1, 1),
(23, 23, 1, 1, 1),
(24, 24, 1, 1, 1),
(25, 25, 1, 1, 1),
(26, 26, 1, 1, 1),
(27, 27, 1, 1, 1),
(28, 28, 1, 1, 1),
(29, 29, 1, 1, 0),
(30, 30, 3, 1, 0),
(31, 31, 3, 3, 1),
(32, 32, 3, 1, 0),
(33, 33, 3, 1, 0),
(34, 34, 3, 1, 0),
(35, 35, 3, 1, 0),
(36, 36, 3, 1, 0),
(37, 37, 3, 1, 0),
(38, 38, 3, 1, 0),
(39, 39, 1, 1, 0),
(40, 40, 1, 1, 0),
(41, 41, 1, 1, 0),
(42, 42, 1, 1, 0),
(43, 43, 1, 1, 0),
(44, 44, 1, 1, 0),
(45, 45, 1, 1, 0),
(46, 46, 1, 1, 0),
(47, 47, 1, 1, 0),
(48, 48, 1, 1, 0),
(49, 49, 1, 1, 0),
(50, 50, 1, 1, 0),
(51, 51, 1, 1, 0),
(52, 52, 1, 1, 0),
(53, 53, 1, 1, 0),
(54, 54, 3, 1, 0),
(55, 55, 3, 1, 0),
(56, 56, 3, 1, 0),
(57, 57, 1, 1, 0),
(58, 58, 1, 1, 0),
(59, 59, 1, 1, 0),
(60, 60, 1, 1, 0),
(61, 61, 1, 1, 0),
(62, 62, 1, 1, 0),
(63, 63, 1, 1, 0),
(64, 64, 1, 1, 0),
(65, 65, 1, 1, 0),
(66, 66, 3, 1, 0),
(67, 67, 1, 1, 0),
(68, 68, 1, 1, 0),
(69, 69, 1, 1, 0),
(70, 70, 3, 1, 0),
(71, 71, 3, 1, 0),
(72, 72, 3, 1, 0),
(73, 73, 3, 1, 0),
(74, 74, 3, 1, 0),
(75, 75, 3, 1, 0),
(76, 76, 3, 1, 0),
(77, 77, 3, 1, 0),
(78, 78, 3, 1, 0),
(79, 79, 3, 1, 0),
(80, 80, 3, 1, 0),
(81, 81, 3, 1, 0),
(82, 82, 3, 1, 0),
(83, 83, 3, 1, 0),
(84, 84, 3, 1, 0),
(85, 85, 3, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `clave`, `descripcion`) VALUES
(1, 'Crear', 'Crear registros'),
(2, 'Leer', 'Leer registros'),
(3, 'Editar', 'Editar registros'),
(4, 'Eliminar', 'Eliminar registros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_modulo_permiso`
--

CREATE TABLE `rol_modulo_permiso` (
  `id_rmp` int(11) NOT NULL,
  `id_tipo_emp` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `rol_modulo_permiso`
--

INSERT INTO `rol_modulo_permiso` (`id_rmp`, `id_tipo_emp`, `id_modulo`, `id_permiso`) VALUES
(1, 6, 1, 1),
(2, 6, 1, 2),
(3, 6, 1, 3),
(4, 6, 1, 4),
(5, 6, 2, 1),
(6, 6, 2, 2),
(7, 6, 2, 3),
(8, 6, 2, 4),
(9, 6, 3, 1),
(10, 6, 3, 2),
(11, 6, 3, 3),
(12, 6, 3, 4),
(13, 6, 4, 1),
(14, 6, 4, 2),
(15, 6, 4, 3),
(16, 6, 4, 4),
(17, 6, 5, 1),
(18, 6, 5, 2),
(19, 6, 5, 3),
(20, 6, 5, 4),
(21, 6, 6, 1),
(22, 6, 6, 2),
(23, 6, 6, 3),
(24, 6, 6, 4),
(25, 6, 7, 1),
(26, 6, 7, 2),
(27, 6, 7, 3),
(28, 6, 7, 4),
(29, 6, 8, 1),
(30, 6, 8, 2),
(31, 6, 8, 3),
(32, 6, 8, 4),
(33, 6, 9, 1),
(34, 6, 9, 2),
(35, 6, 9, 3),
(36, 6, 9, 4),
(37, 6, 10, 1),
(38, 6, 10, 2),
(39, 6, 10, 3),
(40, 6, 10, 4),
(41, 6, 11, 1),
(42, 6, 11, 2),
(43, 6, 11, 3),
(44, 6, 11, 4),
(45, 6, 12, 1),
(46, 6, 12, 2),
(47, 6, 12, 3),
(48, 6, 12, 4),
(49, 6, 13, 1),
(50, 6, 13, 2),
(51, 6, 13, 3),
(52, 6, 13, 4),
(53, 6, 14, 1),
(54, 6, 14, 2),
(55, 6, 14, 3),
(56, 6, 14, 4),
(57, 6, 15, 1),
(58, 6, 15, 2),
(59, 6, 15, 3),
(60, 6, 15, 4),
(61, 6, 16, 1),
(62, 6, 16, 2),
(63, 6, 16, 3),
(64, 6, 16, 4),
(65, 6, 17, 1),
(66, 6, 17, 2),
(67, 6, 17, 3),
(68, 6, 17, 4),
(69, 10, 1, 1),
(70, 10, 1, 2),
(71, 10, 1, 3),
(72, 10, 1, 4),
(73, 10, 2, 1),
(74, 10, 2, 2),
(75, 10, 2, 3),
(76, 10, 2, 4),
(77, 10, 3, 1),
(78, 10, 3, 2),
(79, 10, 3, 3),
(80, 10, 3, 4),
(81, 10, 4, 1),
(82, 10, 4, 2),
(83, 10, 4, 3),
(84, 10, 4, 4),
(85, 10, 5, 1),
(86, 10, 5, 2),
(87, 10, 5, 3),
(88, 10, 5, 4),
(89, 10, 6, 1),
(90, 10, 6, 2),
(91, 10, 6, 3),
(92, 10, 6, 4),
(93, 10, 7, 1),
(94, 10, 7, 2),
(95, 10, 7, 3),
(96, 10, 7, 4),
(97, 10, 8, 1),
(98, 10, 8, 2),
(99, 10, 8, 3),
(100, 10, 8, 4),
(101, 10, 9, 1),
(102, 10, 9, 2),
(103, 10, 9, 3),
(104, 10, 9, 4),
(105, 10, 10, 1),
(106, 10, 10, 2),
(107, 10, 10, 3),
(108, 10, 10, 4),
(109, 10, 11, 1),
(110, 10, 11, 2),
(111, 10, 11, 3),
(112, 10, 11, 4),
(113, 10, 12, 1),
(114, 10, 12, 2),
(115, 10, 12, 3),
(116, 10, 12, 4),
(117, 10, 13, 1),
(118, 10, 13, 2),
(119, 10, 13, 3),
(120, 10, 13, 4),
(121, 10, 14, 1),
(122, 10, 14, 2),
(123, 10, 14, 3),
(124, 10, 14, 4),
(125, 10, 15, 1),
(126, 10, 15, 2),
(127, 10, 15, 3),
(128, 10, 15, 4),
(129, 10, 16, 1),
(130, 10, 16, 2),
(131, 10, 16, 3),
(132, 10, 16, 4),
(133, 10, 17, 1),
(134, 10, 17, 2),
(135, 10, 17, 3),
(136, 10, 17, 4),
(137, 1, 2, 1),
(138, 1, 2, 2),
(139, 1, 2, 3),
(140, 1, 2, 4),
(141, 1, 3, 1),
(142, 1, 3, 2),
(143, 1, 3, 3),
(144, 1, 3, 4),
(145, 1, 4, 1),
(146, 1, 4, 2),
(147, 1, 4, 3),
(148, 1, 4, 4),
(149, 1, 10, 1),
(150, 1, 10, 2),
(151, 1, 10, 3),
(152, 1, 10, 4),
(153, 1, 15, 1),
(154, 1, 15, 2),
(155, 1, 15, 3),
(156, 1, 15, 4),
(157, 2, 2, 1),
(158, 2, 2, 2),
(159, 2, 2, 3),
(160, 2, 2, 4),
(161, 2, 5, 1),
(162, 2, 5, 2),
(163, 2, 5, 3),
(164, 2, 5, 4),
(165, 2, 9, 1),
(166, 2, 9, 2),
(167, 2, 9, 3),
(168, 2, 9, 4),
(169, 2, 10, 1),
(170, 2, 10, 2),
(171, 2, 10, 3),
(172, 2, 10, 4),
(173, 2, 11, 1),
(174, 2, 11, 2),
(175, 2, 11, 3),
(176, 2, 11, 4),
(177, 2, 15, 1),
(178, 2, 15, 2),
(179, 2, 15, 3),
(180, 2, 15, 4),
(181, 3, 2, 1),
(182, 3, 2, 2),
(183, 3, 2, 3),
(184, 3, 2, 4),
(185, 3, 7, 1),
(186, 3, 7, 2),
(187, 3, 7, 3),
(188, 3, 7, 4),
(189, 3, 10, 1),
(190, 3, 10, 2),
(191, 3, 10, 3),
(192, 3, 10, 4),
(193, 3, 15, 1),
(194, 3, 15, 2),
(195, 3, 15, 3),
(196, 3, 15, 4),
(197, 4, 2, 1),
(198, 4, 2, 2),
(199, 4, 2, 3),
(200, 4, 2, 4),
(201, 4, 6, 1),
(202, 4, 6, 2),
(203, 4, 6, 3),
(204, 4, 6, 4),
(205, 4, 10, 1),
(206, 4, 10, 2),
(207, 4, 10, 3),
(208, 4, 10, 4),
(209, 4, 15, 1),
(210, 4, 15, 2),
(211, 4, 15, 3),
(212, 4, 15, 4),
(213, 5, 2, 1),
(214, 5, 2, 2),
(215, 5, 2, 3),
(216, 5, 2, 4),
(217, 5, 8, 1),
(218, 5, 8, 2),
(219, 5, 8, 3),
(220, 5, 8, 4),
(221, 5, 10, 1),
(222, 5, 10, 2),
(223, 5, 10, 3),
(224, 5, 10, 4),
(225, 5, 15, 1),
(226, 5, 15, 2),
(227, 5, 15, 3),
(228, 5, 15, 4),
(229, 11, 15, 1),
(230, 11, 15, 2),
(231, 11, 15, 3),
(232, 11, 15, 4),
(233, 6, 18, 1),
(234, 6, 18, 2),
(235, 6, 18, 3),
(236, 6, 18, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `id_tipo_emp` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `id_servicios` int(11) NOT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`id_tipo_emp`, `tipo`, `id_servicios`, `estatus`, `fecha_creacion`) VALUES
(1, 'Psicologo', 1, 1, '2024-11-12'),
(2, 'Medico', 2, 1, '2024-11-12'),
(3, 'Trabajador Social', 4, 1, '2024-11-12'),
(4, 'Orientador', 3, 1, '2024-11-12'),
(5, 'Discapacidad', 5, 1, '2024-11-12'),
(6, 'Administrador', 8, 1, '2024-11-12'),
(7, 'Secretaria', 6, 1, '2024-11-14'),
(8, 'Chofer', 9, 1, '2025-04-19'),
(9, 'Mecánico', 9, 1, '2025-04-19'),
(10, 'Superusuario', 8, 1, '2025-05-30'),
(11, 'Administrativo', 6, 1, '2025-06-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_tipo_empleado` (`id_tipo_empleado`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificaciones`);

--
-- Indices de la tabla `notificaciones_empleados`
--
ALTER TABLE `notificaciones_empleados`
  ADD PRIMARY KEY (`id_notificaciones_empleados`),
  ADD KEY `id_notificaciones` (`id_notificaciones`),
  ADD KEY `id_emisor` (`id_emisor`),
  ADD KEY `id_receptor` (`id_receptor`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `rol_modulo_permiso`
--
ALTER TABLE `rol_modulo_permiso`
  ADD PRIMARY KEY (`id_rmp`),
  ADD KEY `id_tipo_emp` (`id_tipo_emp`),
  ADD KEY `id_modulo` (`id_modulo`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`id_tipo_emp`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `notificaciones_empleados`
--
ALTER TABLE `notificaciones_empleados`
  MODIFY `id_notificaciones_empleados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol_modulo_permiso`
--
ALTER TABLE `rol_modulo_permiso`
  MODIFY `id_rmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_tipo_empleado`) REFERENCES `tipo_empleado` (`id_tipo_emp`);

--
-- Filtros para la tabla `notificaciones_empleados`
--
ALTER TABLE `notificaciones_empleados`
  ADD CONSTRAINT `notificaciones_empleados_ibfk_1` FOREIGN KEY (`id_notificaciones`) REFERENCES `notificaciones` (`id_notificaciones`),
  ADD CONSTRAINT `notificaciones_empleados_ibfk_2` FOREIGN KEY (`id_emisor`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `notificaciones_empleados_ibfk_3` FOREIGN KEY (`id_receptor`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `rol_modulo_permiso`
--
ALTER TABLE `rol_modulo_permiso`
  ADD CONSTRAINT `rol_modulo_permiso_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`),
  ADD CONSTRAINT `rol_modulo_permiso_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`),
  ADD CONSTRAINT `rol_modulo_permiso_ibfk_3` FOREIGN KEY (`id_tipo_emp`) REFERENCES `tipo_empleado` (`id_tipo_emp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
