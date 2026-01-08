-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-12-2025 a las 16:53:13
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
-- Base de datos: `dirpoles_business`
--
CREATE DATABASE IF NOT EXISTS `dirpoles_business` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `dirpoles_business`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_rutas`
--

CREATE TABLE `asignaciones_rutas` (
  `id_asignacion` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `estatus` enum('Activa','Inactiva') DEFAULT 'Activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `asignaciones_rutas`
--

INSERT INTO `asignaciones_rutas` (`id_asignacion`, `id_ruta`, `id_vehiculo`, `id_empleado`, `fecha_asignacion`, `estatus`) VALUES
(0, 1, 1, 4, '2025-11-15', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becas`
--

CREATE TABLE `becas` (
  `id_becas` int(11) NOT NULL,
  `id_solicitud_serv` int(11) DEFAULT NULL,
  `cta_bcv` varchar(100) DEFAULT NULL,
  `direccion_pdf` varchar(100) DEFAULT NULL,
  `tipo_banco` varchar(4) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `becas`
--

INSERT INTO `becas` (`id_becas`, `id_solicitud_serv`, `cta_bcv`, `direccion_pdf`, `tipo_banco`, `fecha_creacion`) VALUES
(1, 7, '0102000000000000', 'uploads/trabajo social/becas/planillas de inscripcion/6914c504e9ca3_dirpoles_security.pdf', '0102', '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficiario`
--

CREATE TABLE `beneficiario` (
  `id_beneficiario` int(11) NOT NULL,
  `id_pnf` int(11) DEFAULT NULL,
  `seccion` varchar(20) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `tipo_cedula` varchar(10) NOT NULL,
  `cedula` varchar(12) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `genero` char(10) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estatus` int(10) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `beneficiario`
--

INSERT INTO `beneficiario` (`id_beneficiario`, `id_pnf`, `seccion`, `nombres`, `apellidos`, `tipo_cedula`, `cedula`, `fecha_nac`, `telefono`, `correo`, `genero`, `direccion`, `estatus`, `fecha_creacion`) VALUES
(1, 6, '3102-B', 'Iris', 'Alvarez', 'V', '12023052', '1974-09-19', '04121234444', 'irisalva19@gmail.com', 'F', 'Carrera 13 con calle 54', 1, '2025-12-28 22:08:44'),
(2, 1, '4102-B', 'Eustaquio', 'Ramirez', 'V', '12023051', '2000-01-01', '04162948888', 'eustaquio@gmail.com', 'M', 'Barquisimeto', 1, '2025-12-28 22:08:51'),
(6, 7, '3104-B', 'Prueba', 'Prueba', 'V', '12999292', '2000-12-12', '04261234444', '123@gmail.es', 'M', 'Asdfg', 1, '2025-12-21 04:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_beneficiario` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `estatus` int(1) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `fecha`, `hora`, `id_beneficiario`, `id_empleado`, `estatus`, `fecha_creacion`) VALUES
(3, '2025-12-24', '10:00:00', 2, 3, 2, '2025-12-23'),
(4, '2025-12-24', '12:00:00', 6, 24, 1, '2025-12-24'),
(5, '2025-12-29', '08:30:00', 6, 24, 1, '2025-12-24'),
(6, '2025-12-31', '09:00:00', 2, 3, 3, '2025-12-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta_medica`
--

CREATE TABLE `consulta_medica` (
  `id_consulta_med` int(11) NOT NULL,
  `id_detalle_patologia` int(11) NOT NULL,
  `id_solicitud_serv` int(11) NOT NULL,
  `estatura` decimal(4,2) NOT NULL,
  `peso` decimal(4,2) NOT NULL,
  `tipo_sangre` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `motivo_visita` varchar(255) NOT NULL,
  `diagnostico` varchar(255) NOT NULL,
  `tratamiento` varchar(255) NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta_psicologica`
--

CREATE TABLE `consulta_psicologica` (
  `id_psicologia` int(11) NOT NULL,
  `id_solicitud_serv` int(11) NOT NULL,
  `id_detalle_patologia` int(11) DEFAULT NULL,
  `tipo_consulta` enum('Diagnóstico','Retiro temporal','Cambio de carrera','') NOT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento_gen` text DEFAULT NULL,
  `motivo_retiro` text DEFAULT NULL,
  `duracion_retiro` varchar(50) DEFAULT NULL,
  `motivo_cambio` varchar(100) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `consulta_psicologica`
--

INSERT INTO `consulta_psicologica` (`id_psicologia`, `id_solicitud_serv`, `id_detalle_patologia`, `tipo_consulta`, `diagnostico`, `tratamiento_gen`, `motivo_retiro`, `duracion_retiro`, `motivo_cambio`, `observaciones`, `fecha_creacion`) VALUES
(3, 3, 3, 'Retiro temporal', 'No aplica', 'No aplica', 'Problemas personales/familiares', '6 meses', 'No aplica', 'Nada que observar del beneficiario.', '2025-12-29 15:37:09'),
(5, 5, 5, 'Diagnóstico', 'diagnostico cambiado', 'este tratamiento', 'No aplica', 'No aplica', 'No aplica', 'asdasdasd', '2025-12-29 15:37:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ficha_equipo`
--

CREATE TABLE `detalle_ficha_equipo` (
  `id_detalle` int(11) NOT NULL,
  `id_ficha` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle_ficha_equipo`
--

INSERT INTO `detalle_ficha_equipo` (`id_detalle`, `id_ficha`, `id_equipo`, `observaciones`) VALUES
(1, 1, 1, 'Nada que agregar aca tambien');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ficha_mobiliario`
--

CREATE TABLE `detalle_ficha_mobiliario` (
  `id_detalle` int(11) NOT NULL,
  `id_ficha` int(11) NOT NULL,
  `id_mobiliario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle_ficha_mobiliario`
--

INSERT INTO `detalle_ficha_mobiliario` (`id_detalle`, `id_ficha`, `id_mobiliario`, `cantidad`, `observaciones`) VALUES
(1, 1, 0, 1, 'Nada que agregar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_insumo`
--

CREATE TABLE `detalle_insumo` (
  `id_detalle_insumo` int(11) NOT NULL,
  `id_consulta_med` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad_usada` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_insumo_jornadas`
--

CREATE TABLE `detalle_insumo_jornadas` (
  `id_detalle_insumo_jornadas` int(11) NOT NULL,
  `id_jornadas` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad_usada` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_patologia`
--

CREATE TABLE `detalle_patologia` (
  `id_detalle_patologia` int(11) NOT NULL,
  `id_patologia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle_patologia`
--

INSERT INTO `detalle_patologia` (`id_detalle_patologia`, `id_patologia`) VALUES
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discapacidad`
--

CREATE TABLE `discapacidad` (
  `id_discapacidad` int(11) NOT NULL,
  `id_solicitud_serv` int(11) NOT NULL,
  `condicion_medica` varchar(500) DEFAULT NULL,
  `cirugia_prev` varchar(2) DEFAULT NULL,
  `toma_medicamentos_reg` varchar(2) DEFAULT NULL,
  `naturaleza_discapacidad` varchar(500) DEFAULT NULL,
  `impacto_disc` varchar(500) DEFAULT NULL,
  `habilidades_funcionales_b` varchar(500) DEFAULT NULL,
  `requiere_asistencia` varchar(2) DEFAULT NULL,
  `dispositivo_asistencia` varchar(500) DEFAULT NULL,
  `salud_mental` varchar(255) NOT NULL,
  `apoyo_psicologico` varchar(100) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `carnet_discapacidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `discapacidad`
--

INSERT INTO `discapacidad` (`id_discapacidad`, `id_solicitud_serv`, `condicion_medica`, `cirugia_prev`, `toma_medicamentos_reg`, `naturaleza_discapacidad`, `impacto_disc`, `habilidades_funcionales_b`, `requiere_asistencia`, `dispositivo_asistencia`, `salud_mental`, `apoyo_psicologico`, `fecha_creacion`, `carnet_discapacidad`) VALUES
(1, 12, 'ninguna, no tiene condición', 'No', 'No', 'naturaleza de la discap', 'impacto de la discap', 'habilidades funcionales', 'No', 'tiene cero dispositivos', 'salud mental estable', 'No', '2025-11-13', '1234444444');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `id_tipo_equipo` int(11) NOT NULL,
  `id_servicios` int(11) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` enum('Nuevo','Bueno','Regular','Malo','En reparación') DEFAULT 'Bueno',
  `fecha_adquisicion` date DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `id_tipo_equipo`, `id_servicios`, `marca`, `modelo`, `serial`, `color`, `estado`, `fecha_adquisicion`, `descripcion`, `observaciones`, `estatus`, `fecha_registro`) VALUES
(1, 1, 1, 'DELL', 'DELL 27 pulgadas', 'abc123', 'negro', 'Bueno', '2025-11-11', 'Nada', 'Nada', 'Activo', '2025-11-13 18:38:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_cita`
--

CREATE TABLE `estado_cita` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `estado_cita`
--

INSERT INTO `estado_cita` (`id_estado`, `nombre`, `descripcion`, `es_activo`, `fecha_creacion`) VALUES
(1, 'Pendiente', 'Cita agendada y pendiente de atención', 1, '2025-12-14 16:02:38'),
(2, 'Confirmada', 'Cita confirmada por el beneficiario', 1, '2025-12-14 16:02:38'),
(3, 'Atendida', 'Cita completada exitosamente', 1, '2025-12-14 16:02:38'),
(4, 'Cancelada', 'Cita cancelada', 1, '2025-12-14 16:02:38'),
(5, 'No asistió', 'Beneficiario no se presentó', 1, '2025-12-14 16:02:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exoneracion`
--

CREATE TABLE `exoneracion` (
  `id_exoneracion` int(11) NOT NULL,
  `id_solicitud_serv` int(11) DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `otro_motivo` varchar(100) DEFAULT NULL,
  `direccion_carta` varchar(100) DEFAULT NULL,
  `direccion_estudiose` varchar(100) DEFAULT NULL,
  `carnet_discapacidad` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `exoneracion`
--

INSERT INTO `exoneracion` (`id_exoneracion`, `id_solicitud_serv`, `motivo`, `otro_motivo`, `direccion_carta`, `direccion_estudiose`, `carnet_discapacidad`, `fecha_creacion`) VALUES
(1, 8, 'inscripcion', 'si', 'uploads/trabajo social/exoneracion/cartas/6914c9e86723a_Carta de solicitud para la Empresa Fritz.pdf', '', 'D- 12121000', '2025-11-12'),
(2, 10, 'pqt_grado', 'si', 'uploads/trabajo social/exoneracion/cartas/6914ddae1ca51_Carta de solicitud para la Empresa Fritz.pdf', '', 'D- 1234444', '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fames`
--

CREATE TABLE `fames` (
  `id_fames` int(11) NOT NULL,
  `id_solicitud_serv` int(11) DEFAULT NULL,
  `id_detalle_patologia` int(11) NOT NULL,
  `tipo_ayuda` varchar(100) NOT NULL,
  `otro_tipo` varchar(100) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `fames`
--

INSERT INTO `fames` (`id_fames`, `id_solicitud_serv`, `id_detalle_patologia`, `tipo_ayuda`, `otro_tipo`, `fecha_creacion`) VALUES
(1, 9, 4, 'economica', 'N/A', '2025-11-12'),
(2, 13, 6, 'embarazo', 'N/A', '2025-11-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas_tecnicas`
--

CREATE TABLE `fichas_tecnicas` (
  `id_ficha` int(11) NOT NULL,
  `nombre_ficha` varchar(100) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_empleado_responsable` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `estatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `fichas_tecnicas`
--

INSERT INTO `fichas_tecnicas` (`id_ficha`, `nombre_ficha`, `id_servicio`, `id_empleado_responsable`, `descripcion`, `fecha_creacion`, `estatus`) VALUES
(1, 'Ficha de prueba uno', 1, 3, 'Descripcion de la ficha', '2025-11-13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion_emb`
--

CREATE TABLE `gestion_emb` (
  `id_gestion` int(11) NOT NULL,
  `id_solicitud_serv` int(11) NOT NULL,
  `id_detalle_patologia` int(11) NOT NULL,
  `semanas_gest` int(11) NOT NULL,
  `codigo_patria` int(11) DEFAULT NULL,
  `serial_patria` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `gestion_emb`
--

INSERT INTO `gestion_emb` (`id_gestion`, `id_solicitud_serv`, `id_detalle_patologia`, `semanas_gest`, `codigo_patria`, `serial_patria`, `estado`, `fecha_creacion`) VALUES
(5, 17, 10, 22, 12344444, 1231231444, 'En proceso', '2025-11-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_inventario`
--

CREATE TABLE `historial_inventario` (
  `id_historial` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `tipo_item` enum('mobiliario','equipo') NOT NULL,
  `id_item` int(11) NOT NULL,
  `tipo_movimiento` enum('asignacion','reubicacion','baja','modificacion') NOT NULL,
  `id_ficha` int(11) DEFAULT NULL,
  `id_servicio_anterior` int(11) DEFAULT NULL,
  `id_servicio_nuevo` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `historial_inventario`
--

INSERT INTO `historial_inventario` (`id_historial`, `id_empleado`, `tipo_item`, `id_item`, `tipo_movimiento`, `id_ficha`, `id_servicio_anterior`, `id_servicio_nuevo`, `descripcion`, `fecha_movimiento`) VALUES
(1, 1, 'mobiliario', 0, '', NULL, NULL, 1, 'Registro inicial de mobiliario', '2025-11-13 18:38:22'),
(2, 1, 'equipo', 1, '', NULL, NULL, 1, 'Registro inicial de equipo', '2025-11-13 18:38:51'),
(3, 1, 'mobiliario', 0, 'asignacion', 1, NULL, 1, 'Asignado a ficha técnica', '2025-11-13 20:43:10'),
(4, 1, 'equipo', 1, 'asignacion', 1, NULL, 1, 'Asignado a ficha técnica', '2025-11-13 20:43:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_horario`, `id_empleado`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 3, 'Lunes', '08:30:00', '12:00:00'),
(2, 3, 'Miércoles', '09:00:00', '15:00:00'),
(4, 24, 'Lunes', '07:50:00', '15:50:00'),
(5, 24, 'Martes', '08:00:00', '16:00:00'),
(10, 24, 'Miércoles', '08:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id_insumo` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `nombre_insumo` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo_insumo` varchar(50) DEFAULT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_creacion` date NOT NULL,
  `cantidad` int(255) NOT NULL,
  `estatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id_insumo`, `id_presentacion`, `nombre_insumo`, `descripcion`, `tipo_insumo`, `fecha_vencimiento`, `fecha_creacion`, `cantidad`, `estatus`) VALUES
(1, 1, 'Acetaminofen', 'Acetaminofén de 500mg en pastillas', 'Medicamento', '2027-01-04', '2025-11-13', 9, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_medico`
--

CREATE TABLE `inventario_medico` (
  `id_inv_med` int(11) NOT NULL,
  `id_insumo` int(11) DEFAULT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `tipo_movimiento` varchar(100) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `inventario_medico`
--

INSERT INTO `inventario_medico` (`id_inv_med`, `id_insumo`, `id_empleado`, `fecha_movimiento`, `tipo_movimiento`, `cantidad`, `descripcion`) VALUES
(1, 1, 1, '2025-11-13', 'Registro', 0, 'Nuevo registro'),
(2, 1, 1, '2025-11-13', 'Entrada', 10, 'Entrada'),
(4, 1, 1, '2025-11-13', 'Salida', 1, 'Uso en jornada médica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_mob`
--

CREATE TABLE `inventario_mob` (
  `id_inventario_mob` int(11) NOT NULL,
  `id_mobiliario` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_movimiento` date NOT NULL,
  `tipo_movimiento` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_repuestos`
--

CREATE TABLE `inventario_repuestos` (
  `id_inventario` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `cantidad` varchar(100) NOT NULL,
  `tipo_movimiento` varchar(50) NOT NULL,
  `razon_movimiento` varchar(255) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `inventario_repuestos`
--

INSERT INTO `inventario_repuestos` (`id_inventario`, `id_repuesto`, `id_empleado`, `cantidad`, `tipo_movimiento`, `razon_movimiento`, `fecha_movimiento`) VALUES
(1, 1, 1, '10', 'Entrada', 'Compra al proveedor', '2025-11-13 22:00:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas_medicas`
--

CREATE TABLE `jornadas_medicas` (
  `id_jornada` int(11) NOT NULL,
  `nombre_jornada` varchar(100) NOT NULL,
  `tipo_jornada` varchar(50) NOT NULL,
  `aforo_maximo` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estatus` enum('Activa','Cancelada','Finalizada') DEFAULT 'Activa',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `jornadas_medicas`
--

INSERT INTO `jornadas_medicas` (`id_jornada`, `nombre_jornada`, `tipo_jornada`, `aforo_maximo`, `fecha_inicio`, `fecha_fin`, `ubicacion`, `descripcion`, `estatus`, `fecha_creacion`) VALUES
(1, 'Jornada de prueba', 'Medica', 1, '2025-11-30 14:15:00', '2025-12-03 18:00:00', 'La salle', 'Jornada de prueba', 'Activa', '2025-11-13 18:13:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada_beneficiarios`
--

CREATE TABLE `jornada_beneficiarios` (
  `id_jornada_beneficiario` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('Femenino','Masculino') DEFAULT NULL,
  `tipo_paciente` enum('Estudiante','Personal Obrero','Personal Docente','Personal Administrativo','Comunidad') DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_jornada` int(11) NOT NULL,
  `fecha_atencion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estatus` enum('Atendido','Cancelado') DEFAULT 'Atendido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `jornada_beneficiarios`
--

INSERT INTO `jornada_beneficiarios` (`id_jornada_beneficiario`, `cedula`, `nombres`, `apellidos`, `fecha_nacimiento`, `genero`, `tipo_paciente`, `telefono`, `correo`, `direccion`, `id_jornada`, `fecha_atencion`, `estatus`) VALUES
(1, '28999853', 'Santiago', 'Querales', '2012-12-12', 'Masculino', 'Comunidad', '04125559877', 'santi@gmail.com', 'calle 1 de pueblo nuevo', 1, '2025-11-13 18:24:00', 'Atendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada_diagnosticos`
--

CREATE TABLE `jornada_diagnosticos` (
  `id_jornada_diagnostico` int(11) NOT NULL,
  `id_jornada_beneficiario` int(11) NOT NULL,
  `id_empleado_medico` int(11) NOT NULL,
  `diagnostico` text NOT NULL,
  `tratamiento` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_diagnostico` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `jornada_diagnosticos`
--

INSERT INTO `jornada_diagnosticos` (`id_jornada_diagnostico`, `id_jornada_beneficiario`, `id_empleado_medico`, `diagnostico`, `tratamiento`, `observaciones`, `fecha_diagnostico`) VALUES
(1, 1, 1, 'Ninguno', 'Ninguno', 'Nada que agregar', '2025-11-13 18:24:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada_insumos`
--

CREATE TABLE `jornada_insumos` (
  `id_jornada_insumo` int(11) NOT NULL,
  `id_jornada_diagnostico` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad_usada` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `jornada_insumos`
--

INSERT INTO `jornada_insumos` (`id_jornada_insumo`, `id_jornada_diagnostico`, `id_insumo`, `cantidad_usada`, `descripcion`) VALUES
(1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_referencias`
--

CREATE TABLE `log_referencias` (
  `id_log` int(11) NOT NULL,
  `id_referencia` int(11) NOT NULL,
  `estado_anterior` enum('Pendiente','Aceptada','Rechazada') DEFAULT NULL,
  `estado_nuevo` enum('Pendiente','Aceptada','Rechazada') NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_accion` datetime DEFAULT current_timestamp(),
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `log_referencias`
--

INSERT INTO `log_referencias` (`id_log`, `id_referencia`, `estado_anterior`, `estado_nuevo`, `id_empleado`, `fecha_accion`, `observaciones`) VALUES
(1, 1, 'Pendiente', 'Aceptada', 3, '2025-11-15 10:43:32', 'Referencia aceptada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_vehiculos`
--

CREATE TABLE `mantenimiento_vehiculos` (
  `id_mantenimiento` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL,
  `tipo` enum('Preventivo','Correctivo') NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mobiliario`
--

CREATE TABLE `mobiliario` (
  `id_mobiliario` int(11) NOT NULL,
  `id_tipo_mobiliario` int(11) DEFAULT NULL,
  `id_servicios` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `estado` enum('Nuevo','Bueno','Regular','Malo','En reparación') DEFAULT 'Bueno',
  `estatus` enum('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `descripcion_adicional` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `mobiliario`
--

INSERT INTO `mobiliario` (`id_mobiliario`, `id_tipo_mobiliario`, `id_servicios`, `cantidad`, `estado`, `estatus`, `fecha_registro`, `marca`, `modelo`, `color`, `fecha_adquisicion`, `descripcion_adicional`, `observaciones`) VALUES
(0, 1, 1, 1, 'Bueno', 'Activo', '2025-11-13 18:38:22', 'EPA', 'Finex', 'Marron', '2025-11-12', 'Nada', 'Nada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orientacion`
--

CREATE TABLE `orientacion` (
  `id_orientacion` int(11) NOT NULL,
  `id_solicitud_serv` int(11) DEFAULT NULL,
  `motivo_orientacion` mediumtext DEFAULT NULL,
  `descripcion_orientacion` mediumtext DEFAULT NULL,
  `obs_adic_orientacion` mediumtext DEFAULT NULL,
  `indicaciones_orientacion` mediumtext DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologia`
--

CREATE TABLE `patologia` (
  `id_patologia` int(11) NOT NULL,
  `nombre_patologia` varchar(100) DEFAULT NULL,
  `tipo_patologia` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `patologia`
--

INSERT INTO `patologia` (`id_patologia`, `nombre_patologia`, `tipo_patologia`, `fecha_creacion`) VALUES
(1, 'Sin patología médica', 'medica', '2025-11-12'),
(2, 'Sin patología psicológica', 'psicologica', '2025-11-12'),
(3, 'Sin patología general', 'general', '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pnf`
--

CREATE TABLE `pnf` (
  `id_pnf` int(11) NOT NULL,
  `nombre_pnf` varchar(100) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pnf`
--

INSERT INTO `pnf` (`id_pnf`, `nombre_pnf`, `estatus`, `fecha_creacion`) VALUES
(1, 'PNF Administración', 1, '2024-11-12'),
(2, 'PNF Contaduría Pública', 1, '2024-11-12'),
(3, 'PNF Informática', 1, '2024-11-12'),
(4, 'PNF Higiene y Seguridad Laboral', 1, '2024-11-12'),
(5, 'PNF Deporte', 1, '2024-11-12'),
(6, 'PNF Turismo', 1, '2024-11-12'),
(7, 'PNF Ciencias de la Información', 1, '2024-11-12'),
(8, 'PNF Sistemas de Calidad y Ambiente', 1, '2024-11-12'),
(9, 'PNF Agroalimentación', 1, '2024-11-12'),
(10, 'PNF Distribución y Logística', 1, '2024-11-12'),
(11, 'PNF Materiales Industriales', 1, '2024-11-26'),
(12, 'PNF Procesos Químicos', 1, '2024-11-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion_insumo`
--

CREATE TABLE `presentacion_insumo` (
  `id_presentacion` int(11) NOT NULL,
  `nombre_presentacion` varchar(100) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `presentacion_insumo`
--

INSERT INTO `presentacion_insumo` (`id_presentacion`, `nombre_presentacion`, `fecha_creacion`) VALUES
(1, 'Pastillas', '2025-11-12'),
(2, 'Capsulas', '2025-11-12'),
(3, 'Polvo', '2025-11-12'),
(4, 'Líquida', '2025-11-12'),
(5, 'Otro tipo', '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `tipo_documento` enum('V','E','J','G') NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estatus` varchar(10) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `tipo_documento`, `num_documento`, `nombre`, `telefono`, `correo`, `direccion`, `estatus`, `fecha_creacion`) VALUES
(1, 'V', '282814331', 'Inversiones Roberth', '04129298001', 'roberthmatos.inversiones@gmail.es', 'Calle 54, Barquisimeto', 'Activo', '2025-11-13 04:00:00'),
(2, 'E', '84650122', 'Inversiones Yutongs', '04121234545', 'yutones@gmail.es', 'China, av. principal', 'Activo', '2025-11-13 04:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias`
--

CREATE TABLE `referencias` (
  `id_referencia` int(11) NOT NULL,
  `id_beneficiario` int(11) NOT NULL,
  `id_empleado_origen` int(11) NOT NULL,
  `id_servicio_origen` int(11) NOT NULL,
  `id_empleado_destino` int(11) DEFAULT NULL,
  `id_servicio_destino` int(11) NOT NULL,
  `fecha_referencia` timestamp NOT NULL DEFAULT current_timestamp(),
  `motivo` varchar(255) DEFAULT NULL,
  `estado` enum('Pendiente','Aceptada','Rechazada') DEFAULT 'Pendiente',
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `referencias`
--

INSERT INTO `referencias` (`id_referencia`, `id_beneficiario`, `id_empleado_origen`, `id_servicio_origen`, `id_empleado_destino`, `id_servicio_destino`, `fecha_referencia`, `motivo`, `estado`, `observaciones`) VALUES
(1, 2, 1, 8, 3, 1, '2025-11-13 15:30:23', 'Referido de prueba', 'Aceptada', 'Observaciones'),
(2, 1, 5, 2, 3, 1, '2025-11-16 16:40:31', 'motivo para probar', 'Pendiente', 'observaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos_mantenimiento`
--

CREATE TABLE `repuestos_mantenimiento` (
  `id_repuestos_inv` int(11) NOT NULL,
  `id_mantenimiento` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `cantidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos_vehiculos`
--

CREATE TABLE `repuestos_vehiculos` (
  `id_repuesto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `id_proveedor` int(10) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `estatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `repuestos_vehiculos`
--

INSERT INTO `repuestos_vehiculos` (`id_repuesto`, `nombre`, `descripcion`, `cantidad`, `id_proveedor`, `fecha_creacion`, `estatus`) VALUES
(1, 'Filtro de Aceite', 'Filtro de aceite para autobús yutong', 10, 1, '2025-11-12', 'Nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id_ruta` int(11) NOT NULL,
  `nombre_ruta` varchar(100) NOT NULL,
  `trayectoria` text DEFAULT NULL,
  `tipo_ruta` varchar(100) NOT NULL,
  `horario_salida` time DEFAULT NULL,
  `horario_llegada` time DEFAULT NULL,
  `punto_partida` varchar(255) DEFAULT NULL,
  `punto_destino` varchar(255) DEFAULT NULL,
  `estatus` enum('Activa','Inactiva') DEFAULT 'Activa',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id_ruta`, `nombre_ruta`, `trayectoria`, `tipo_ruta`, `horario_salida`, `horario_llegada`, `punto_partida`, `punto_destino`, `estatus`, `fecha_creacion`) VALUES
(1, 'Ruta Oeste', 'Recorre desde el terminal principal hasta la av. Los horcones en la entrada de la universidad.', 'Inter-Urbana', '08:00:00', '09:00:00', 'Terminal principal de Quibor', 'Uptaeb', 'Activa', '2025-11-13 04:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicios` int(11) NOT NULL,
  `nombre_serv` varchar(50) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicios`, `nombre_serv`, `estatus`, `fecha_creacion`) VALUES
(1, 'Psicologia', 1, '2024-11-12'),
(2, 'Medicina', 1, '2024-11-12'),
(3, 'Orientacion', 1, '2024-11-12'),
(4, 'Trabajo Social', 1, '2024-11-12'),
(5, 'Discapacidad', 1, '2024-11-12'),
(6, 'General', 1, '2024-11-20'),
(7, 'Comedor', 1, '2024-11-21'),
(8, 'Gerente', 1, '2025-04-17'),
(9, 'Transporte', 1, '2025-04-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_de_servicio`
--

CREATE TABLE `solicitud_de_servicio` (
  `id_solicitud_serv` int(11) NOT NULL,
  `id_servicios` int(11) NOT NULL,
  `id_beneficiario` int(11) DEFAULT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `solicitud_de_servicio`
--

INSERT INTO `solicitud_de_servicio` (`id_solicitud_serv`, `id_servicios`, `id_beneficiario`, `id_empleado`) VALUES
(3, 1, 2, 3),
(5, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_equipo`
--

CREATE TABLE `tipo_equipo` (
  `id_tipo_equipo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT 1,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_equipo`
--

INSERT INTO `tipo_equipo` (`id_tipo_equipo`, `nombre`, `descripcion`, `estatus`, `fecha_creacion`) VALUES
(1, 'Monitor LCD', 'Monitor ACER', 1, '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mobiliario`
--

CREATE TABLE `tipo_mobiliario` (
  `id_tipo_mobiliario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT 1,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_mobiliario`
--

INSERT INTO `tipo_mobiliario` (`id_tipo_mobiliario`, `nombre`, `descripcion`, `estatus`, `fecha_creacion`) VALUES
(1, 'Escritorio de madera', 'Escritorio de madera compacto', 1, '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `tipo` enum('Autobús','Camioneta','Automóvil') NOT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo','Mantenimiento') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `placa`, `modelo`, `tipo`, `fecha_adquisicion`, `estado`) VALUES
(1, 'ABC1234', 'Yutong 50 puestos', 'Autobús', '2025-01-01', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaciones_rutas`
--
ALTER TABLE `asignaciones_rutas`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `becas`
--
ALTER TABLE `becas`
  ADD PRIMARY KEY (`id_becas`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`);

--
-- Indices de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD PRIMARY KEY (`id_beneficiario`),
  ADD KEY `id_pnf` (`id_pnf`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_beneficiario` (`id_beneficiario`),
  ADD KEY `estatus` (`estatus`);

--
-- Indices de la tabla `consulta_medica`
--
ALTER TABLE `consulta_medica`
  ADD PRIMARY KEY (`id_consulta_med`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`),
  ADD KEY `id_detalle_patologia` (`id_detalle_patologia`);

--
-- Indices de la tabla `consulta_psicologica`
--
ALTER TABLE `consulta_psicologica`
  ADD PRIMARY KEY (`id_psicologia`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`),
  ADD KEY `id_detalle_patologia` (`id_detalle_patologia`);

--
-- Indices de la tabla `detalle_ficha_equipo`
--
ALTER TABLE `detalle_ficha_equipo`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_ficha` (`id_ficha`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `detalle_ficha_mobiliario`
--
ALTER TABLE `detalle_ficha_mobiliario`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_ficha` (`id_ficha`),
  ADD KEY `id_mobiliario` (`id_mobiliario`);

--
-- Indices de la tabla `detalle_insumo`
--
ALTER TABLE `detalle_insumo`
  ADD PRIMARY KEY (`id_detalle_insumo`),
  ADD KEY `id_consulta_med` (`id_consulta_med`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `detalle_insumo_jornadas`
--
ALTER TABLE `detalle_insumo_jornadas`
  ADD PRIMARY KEY (`id_detalle_insumo_jornadas`),
  ADD KEY `id_jornadas` (`id_jornadas`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `detalle_patologia`
--
ALTER TABLE `detalle_patologia`
  ADD PRIMARY KEY (`id_detalle_patologia`),
  ADD KEY `id_patologia` (`id_patologia`);

--
-- Indices de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  ADD PRIMARY KEY (`id_discapacidad`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_tipo_equipo` (`id_tipo_equipo`),
  ADD KEY `id_servicios` (`id_servicios`);

--
-- Indices de la tabla `estado_cita`
--
ALTER TABLE `estado_cita`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `exoneracion`
--
ALTER TABLE `exoneracion`
  ADD PRIMARY KEY (`id_exoneracion`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`);

--
-- Indices de la tabla `fames`
--
ALTER TABLE `fames`
  ADD PRIMARY KEY (`id_fames`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`),
  ADD KEY `id_detalle_patologia` (`id_detalle_patologia`);

--
-- Indices de la tabla `fichas_tecnicas`
--
ALTER TABLE `fichas_tecnicas`
  ADD PRIMARY KEY (`id_ficha`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `gestion_emb`
--
ALTER TABLE `gestion_emb`
  ADD PRIMARY KEY (`id_gestion`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`),
  ADD KEY `id_detalle_patologia` (`id_detalle_patologia`);

--
-- Indices de la tabla `historial_inventario`
--
ALTER TABLE `historial_inventario`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_ficha` (`id_ficha`),
  ADD KEY `id_servicio_anterior` (`id_servicio_anterior`),
  ADD KEY `id_servicio_nuevo` (`id_servicio_nuevo`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id_insumo`),
  ADD KEY `id_presentacion` (`id_presentacion`);

--
-- Indices de la tabla `inventario_medico`
--
ALTER TABLE `inventario_medico`
  ADD PRIMARY KEY (`id_inv_med`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `inventario_mob`
--
ALTER TABLE `inventario_mob`
  ADD PRIMARY KEY (`id_inventario_mob`),
  ADD KEY `id_mobiliario` (`id_mobiliario`);

--
-- Indices de la tabla `inventario_repuestos`
--
ALTER TABLE `inventario_repuestos`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `jornadas_medicas`
--
ALTER TABLE `jornadas_medicas`
  ADD PRIMARY KEY (`id_jornada`);

--
-- Indices de la tabla `jornada_beneficiarios`
--
ALTER TABLE `jornada_beneficiarios`
  ADD PRIMARY KEY (`id_jornada_beneficiario`),
  ADD KEY `id_jornada` (`id_jornada`);

--
-- Indices de la tabla `jornada_diagnosticos`
--
ALTER TABLE `jornada_diagnosticos`
  ADD PRIMARY KEY (`id_jornada_diagnostico`),
  ADD KEY `id_jornada_beneficiario` (`id_jornada_beneficiario`);

--
-- Indices de la tabla `jornada_insumos`
--
ALTER TABLE `jornada_insumos`
  ADD PRIMARY KEY (`id_jornada_insumo`),
  ADD KEY `id_jornada_diagnostico` (`id_jornada_diagnostico`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `log_referencias`
--
ALTER TABLE `log_referencias`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_referencia` (`id_referencia`);

--
-- Indices de la tabla `mantenimiento_vehiculos`
--
ALTER TABLE `mantenimiento_vehiculos`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `id_vehiculo` (`id_vehiculo`);

--
-- Indices de la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD PRIMARY KEY (`id_mobiliario`),
  ADD KEY `id_tipo_mobiliario` (`id_tipo_mobiliario`),
  ADD KEY `id_servicios` (`id_servicios`);

--
-- Indices de la tabla `orientacion`
--
ALTER TABLE `orientacion`
  ADD PRIMARY KEY (`id_orientacion`),
  ADD KEY `id_solicitud_serv` (`id_solicitud_serv`);

--
-- Indices de la tabla `patologia`
--
ALTER TABLE `patologia`
  ADD PRIMARY KEY (`id_patologia`);

--
-- Indices de la tabla `pnf`
--
ALTER TABLE `pnf`
  ADD PRIMARY KEY (`id_pnf`);

--
-- Indices de la tabla `presentacion_insumo`
--
ALTER TABLE `presentacion_insumo`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `referencias`
--
ALTER TABLE `referencias`
  ADD PRIMARY KEY (`id_referencia`),
  ADD KEY `id_beneficiario` (`id_beneficiario`),
  ADD KEY `id_servicio_origen` (`id_servicio_origen`),
  ADD KEY `id_servicio_destino` (`id_servicio_destino`);

--
-- Indices de la tabla `repuestos_mantenimiento`
--
ALTER TABLE `repuestos_mantenimiento`
  ADD PRIMARY KEY (`id_repuestos_inv`),
  ADD KEY `id_mantenimiento` (`id_mantenimiento`),
  ADD KEY `id_repuesto` (`id_repuesto`);

--
-- Indices de la tabla `repuestos_vehiculos`
--
ALTER TABLE `repuestos_vehiculos`
  ADD PRIMARY KEY (`id_repuesto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id_ruta`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `solicitud_de_servicio`
--
ALTER TABLE `solicitud_de_servicio`
  ADD PRIMARY KEY (`id_solicitud_serv`),
  ADD KEY `id_beneficiario` (`id_beneficiario`),
  ADD KEY `id_servicios` (`id_servicios`);

--
-- Indices de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  ADD PRIMARY KEY (`id_tipo_equipo`);

--
-- Indices de la tabla `tipo_mobiliario`
--
ALTER TABLE `tipo_mobiliario`
  ADD PRIMARY KEY (`id_tipo_mobiliario`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `becas`
--
ALTER TABLE `becas`
  MODIFY `id_becas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  MODIFY `id_beneficiario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `consulta_medica`
--
ALTER TABLE `consulta_medica`
  MODIFY `id_consulta_med` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consulta_psicologica`
--
ALTER TABLE `consulta_psicologica`
  MODIFY `id_psicologia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_ficha_equipo`
--
ALTER TABLE `detalle_ficha_equipo`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ficha_mobiliario`
--
ALTER TABLE `detalle_ficha_mobiliario`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_insumo`
--
ALTER TABLE `detalle_insumo`
  MODIFY `id_detalle_insumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_insumo_jornadas`
--
ALTER TABLE `detalle_insumo_jornadas`
  MODIFY `id_detalle_insumo_jornadas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_patologia`
--
ALTER TABLE `detalle_patologia`
  MODIFY `id_detalle_patologia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  MODIFY `id_discapacidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado_cita`
--
ALTER TABLE `estado_cita`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `exoneracion`
--
ALTER TABLE `exoneracion`
  MODIFY `id_exoneracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fames`
--
ALTER TABLE `fames`
  MODIFY `id_fames` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fichas_tecnicas`
--
ALTER TABLE `fichas_tecnicas`
  MODIFY `id_ficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gestion_emb`
--
ALTER TABLE `gestion_emb`
  MODIFY `id_gestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historial_inventario`
--
ALTER TABLE `historial_inventario`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inventario_medico`
--
ALTER TABLE `inventario_medico`
  MODIFY `id_inv_med` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventario_mob`
--
ALTER TABLE `inventario_mob`
  MODIFY `id_inventario_mob` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_repuestos`
--
ALTER TABLE `inventario_repuestos`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jornadas_medicas`
--
ALTER TABLE `jornadas_medicas`
  MODIFY `id_jornada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jornada_beneficiarios`
--
ALTER TABLE `jornada_beneficiarios`
  MODIFY `id_jornada_beneficiario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jornada_diagnosticos`
--
ALTER TABLE `jornada_diagnosticos`
  MODIFY `id_jornada_diagnostico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jornada_insumos`
--
ALTER TABLE `jornada_insumos`
  MODIFY `id_jornada_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log_referencias`
--
ALTER TABLE `log_referencias`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mantenimiento_vehiculos`
--
ALTER TABLE `mantenimiento_vehiculos`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orientacion`
--
ALTER TABLE `orientacion`
  MODIFY `id_orientacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `patologia`
--
ALTER TABLE `patologia`
  MODIFY `id_patologia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pnf`
--
ALTER TABLE `pnf`
  MODIFY `id_pnf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `presentacion_insumo`
--
ALTER TABLE `presentacion_insumo`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `referencias`
--
ALTER TABLE `referencias`
  MODIFY `id_referencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `repuestos_mantenimiento`
--
ALTER TABLE `repuestos_mantenimiento`
  MODIFY `id_repuestos_inv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repuestos_vehiculos`
--
ALTER TABLE `repuestos_vehiculos`
  MODIFY `id_repuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `solicitud_de_servicio`
--
ALTER TABLE `solicitud_de_servicio`
  MODIFY `id_solicitud_serv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_equipo`
--
ALTER TABLE `tipo_equipo`
  MODIFY `id_tipo_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_mobiliario`
--
ALTER TABLE `tipo_mobiliario`
  MODIFY `id_tipo_mobiliario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones_rutas`
--
ALTER TABLE `asignaciones_rutas`
  ADD CONSTRAINT `asignaciones_rutas_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`),
  ADD CONSTRAINT `asignaciones_rutas_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `becas`
--
ALTER TABLE `becas`
  ADD CONSTRAINT `becas_ibfk_1` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD CONSTRAINT `beneficiario_ibfk_1` FOREIGN KEY (`id_pnf`) REFERENCES `pnf` (`id_pnf`);

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id_beneficiario`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`estatus`) REFERENCES `estado_cita` (`id_estado`);

--
-- Filtros para la tabla `consulta_medica`
--
ALTER TABLE `consulta_medica`
  ADD CONSTRAINT `consulta_medica_ibfk_1` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`),
  ADD CONSTRAINT `consulta_medica_ibfk_2` FOREIGN KEY (`id_detalle_patologia`) REFERENCES `detalle_patologia` (`id_detalle_patologia`);

--
-- Filtros para la tabla `consulta_psicologica`
--
ALTER TABLE `consulta_psicologica`
  ADD CONSTRAINT `consulta_psicologica_ibfk_1` FOREIGN KEY (`id_detalle_patologia`) REFERENCES `detalle_patologia` (`id_detalle_patologia`),
  ADD CONSTRAINT `consulta_psicologica_ibfk_2` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `detalle_ficha_equipo`
--
ALTER TABLE `detalle_ficha_equipo`
  ADD CONSTRAINT `detalle_ficha_equipo_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `detalle_ficha_equipo_ibfk_2` FOREIGN KEY (`id_ficha`) REFERENCES `fichas_tecnicas` (`id_ficha`);

--
-- Filtros para la tabla `detalle_ficha_mobiliario`
--
ALTER TABLE `detalle_ficha_mobiliario`
  ADD CONSTRAINT `detalle_ficha_mobiliario_ibfk_1` FOREIGN KEY (`id_ficha`) REFERENCES `fichas_tecnicas` (`id_ficha`),
  ADD CONSTRAINT `detalle_ficha_mobiliario_ibfk_2` FOREIGN KEY (`id_mobiliario`) REFERENCES `mobiliario` (`id_mobiliario`);

--
-- Filtros para la tabla `detalle_insumo`
--
ALTER TABLE `detalle_insumo`
  ADD CONSTRAINT `detalle_insumo_ibfk_1` FOREIGN KEY (`id_consulta_med`) REFERENCES `consulta_medica` (`id_consulta_med`),
  ADD CONSTRAINT `detalle_insumo_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `detalle_insumo_jornadas`
--
ALTER TABLE `detalle_insumo_jornadas`
  ADD CONSTRAINT `detalle_insumo_jornadas_ibfk_1` FOREIGN KEY (`id_jornadas`) REFERENCES `jornadas_medicas` (`id_jornada`),
  ADD CONSTRAINT `detalle_insumo_jornadas_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `detalle_patologia`
--
ALTER TABLE `detalle_patologia`
  ADD CONSTRAINT `detalle_patologia_ibfk_1` FOREIGN KEY (`id_patologia`) REFERENCES `patologia` (`id_patologia`);

--
-- Filtros para la tabla `discapacidad`
--
ALTER TABLE `discapacidad`
  ADD CONSTRAINT `discapacidad_ibfk_1` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_servicios`) REFERENCES `servicio` (`id_servicios`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`id_tipo_equipo`) REFERENCES `tipo_equipo` (`id_tipo_equipo`);

--
-- Filtros para la tabla `exoneracion`
--
ALTER TABLE `exoneracion`
  ADD CONSTRAINT `exoneracion_ibfk_1` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `fames`
--
ALTER TABLE `fames`
  ADD CONSTRAINT `fames_ibfk_1` FOREIGN KEY (`id_detalle_patologia`) REFERENCES `detalle_patologia` (`id_detalle_patologia`),
  ADD CONSTRAINT `fames_ibfk_2` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `fichas_tecnicas`
--
ALTER TABLE `fichas_tecnicas`
  ADD CONSTRAINT `fichas_tecnicas_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicios`);

--
-- Filtros para la tabla `gestion_emb`
--
ALTER TABLE `gestion_emb`
  ADD CONSTRAINT `gestion_emb_ibfk_1` FOREIGN KEY (`id_detalle_patologia`) REFERENCES `detalle_patologia` (`id_detalle_patologia`),
  ADD CONSTRAINT `gestion_emb_ibfk_2` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `historial_inventario`
--
ALTER TABLE `historial_inventario`
  ADD CONSTRAINT `historial_inventario_ibfk_1` FOREIGN KEY (`id_ficha`) REFERENCES `fichas_tecnicas` (`id_ficha`),
  ADD CONSTRAINT `historial_inventario_ibfk_2` FOREIGN KEY (`id_servicio_anterior`) REFERENCES `servicio` (`id_servicios`),
  ADD CONSTRAINT `historial_inventario_ibfk_3` FOREIGN KEY (`id_servicio_nuevo`) REFERENCES `servicio` (`id_servicios`);

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`id_presentacion`) REFERENCES `presentacion_insumo` (`id_presentacion`);

--
-- Filtros para la tabla `inventario_medico`
--
ALTER TABLE `inventario_medico`
  ADD CONSTRAINT `inventario_medico_ibfk_1` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `inventario_mob`
--
ALTER TABLE `inventario_mob`
  ADD CONSTRAINT `inventario_mob_ibfk_1` FOREIGN KEY (`id_mobiliario`) REFERENCES `mobiliario` (`id_mobiliario`);

--
-- Filtros para la tabla `inventario_repuestos`
--
ALTER TABLE `inventario_repuestos`
  ADD CONSTRAINT `inventario_repuestos_ibfk_1` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos_vehiculos` (`id_repuesto`);

--
-- Filtros para la tabla `jornada_beneficiarios`
--
ALTER TABLE `jornada_beneficiarios`
  ADD CONSTRAINT `jornada_beneficiarios_ibfk_1` FOREIGN KEY (`id_jornada`) REFERENCES `jornadas_medicas` (`id_jornada`);

--
-- Filtros para la tabla `jornada_diagnosticos`
--
ALTER TABLE `jornada_diagnosticos`
  ADD CONSTRAINT `jornada_diagnosticos_ibfk_1` FOREIGN KEY (`id_jornada_beneficiario`) REFERENCES `jornada_beneficiarios` (`id_jornada_beneficiario`);

--
-- Filtros para la tabla `jornada_insumos`
--
ALTER TABLE `jornada_insumos`
  ADD CONSTRAINT `jornada_insumos_ibfk_1` FOREIGN KEY (`id_jornada_diagnostico`) REFERENCES `jornada_diagnosticos` (`id_jornada_diagnostico`),
  ADD CONSTRAINT `jornada_insumos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `log_referencias`
--
ALTER TABLE `log_referencias`
  ADD CONSTRAINT `log_referencias_ibfk_1` FOREIGN KEY (`id_referencia`) REFERENCES `referencias` (`id_referencia`);

--
-- Filtros para la tabla `mantenimiento_vehiculos`
--
ALTER TABLE `mantenimiento_vehiculos`
  ADD CONSTRAINT `mantenimiento_vehiculos_ibfk_1` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `mobiliario`
--
ALTER TABLE `mobiliario`
  ADD CONSTRAINT `mobiliario_ibfk_1` FOREIGN KEY (`id_servicios`) REFERENCES `servicio` (`id_servicios`),
  ADD CONSTRAINT `mobiliario_ibfk_2` FOREIGN KEY (`id_tipo_mobiliario`) REFERENCES `tipo_mobiliario` (`id_tipo_mobiliario`);

--
-- Filtros para la tabla `orientacion`
--
ALTER TABLE `orientacion`
  ADD CONSTRAINT `orientacion_ibfk_1` FOREIGN KEY (`id_solicitud_serv`) REFERENCES `solicitud_de_servicio` (`id_solicitud_serv`);

--
-- Filtros para la tabla `referencias`
--
ALTER TABLE `referencias`
  ADD CONSTRAINT `referencias_ibfk_1` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id_beneficiario`),
  ADD CONSTRAINT `referencias_ibfk_2` FOREIGN KEY (`id_servicio_destino`) REFERENCES `servicio` (`id_servicios`),
  ADD CONSTRAINT `referencias_ibfk_3` FOREIGN KEY (`id_servicio_origen`) REFERENCES `servicio` (`id_servicios`);

--
-- Filtros para la tabla `repuestos_mantenimiento`
--
ALTER TABLE `repuestos_mantenimiento`
  ADD CONSTRAINT `repuestos_mantenimiento_ibfk_1` FOREIGN KEY (`id_mantenimiento`) REFERENCES `mantenimiento_vehiculos` (`id_mantenimiento`),
  ADD CONSTRAINT `repuestos_mantenimiento_ibfk_2` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos_vehiculos` (`id_repuesto`);

--
-- Filtros para la tabla `repuestos_vehiculos`
--
ALTER TABLE `repuestos_vehiculos`
  ADD CONSTRAINT `repuestos_vehiculos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `solicitud_de_servicio`
--
ALTER TABLE `solicitud_de_servicio`
  ADD CONSTRAINT `solicitud_de_servicio_ibfk_1` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id_beneficiario`),
  ADD CONSTRAINT `solicitud_de_servicio_ibfk_2` FOREIGN KEY (`id_servicios`) REFERENCES `servicio` (`id_servicios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
