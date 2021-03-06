-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2021 a las 01:02:23
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbdd conasys 20-02`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `Id_Banco` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bonos_estudiantiles`
--

CREATE TABLE `bonos_estudiantiles` (
  `Id_Bono_Estudiantil` int(11) NOT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Valor_Bono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_bancarias`
--

CREATE TABLE `cuentas_bancarias` (
  `Id_Cuenta` int(11) NOT NULL,
  `Id_Banco` int(11) DEFAULT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Cuenta` bigint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `Id_Departamento` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `Id_Direccion` int(11) NOT NULL,
  `Id_Persona` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `ID_Documento` int(11) NOT NULL,
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Id_Persona` int(11) NOT NULL,
  `Valor` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Id_Empleado` int(11) NOT NULL,
  `Id_Persona` int(11) DEFAULT NULL,
  `Id_Grado_Academico` int(11) DEFAULT NULL,
  `Fecha_Contratacion` date NOT NULL,
  `Sueldo_Base` float NOT NULL,
  `HorasLaborales` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id_Empleado`, `Id_Persona`, `Id_Grado_Academico`, `Fecha_Contratacion`, `Sueldo_Base`, `HorasLaborales`) VALUES
(1, 1, 1, '2021-02-18', 15000, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `descripcion`) VALUES
(1, 'ACTIVO'),
(2, 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados_academicos`
--

CREATE TABLE `grados_academicos` (
  `Id_Grado_Academico` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grados_academicos`
--

INSERT INTO `grados_academicos` (`Id_Grado_Academico`, `Descripcion`) VALUES
(1, 'LICENCIATURA'),
(2, 'MAESTRIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_puesto_empleado`
--

CREATE TABLE `historial_puesto_empleado` (
  `Id_Historial_Puesto` int(11) NOT NULL,
  `Id_Puesto` int(11) NOT NULL,
  `Id_Empleado` int(11) NOT NULL,
  `Fecha_Inicio_Puesto` date NOT NULL,
  `Fecha_Final_Puesto` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_salarios`
--

CREATE TABLE `historial_salarios` (
  `Id_Historial_salario` int(11) NOT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Fecha_Inicio_Salario` date NOT NULL,
  `Fecha_Final_Salario` date NOT NULL,
  `Monto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id_parametro` int(11) NOT NULL,
  `parametro` varchar(25) DEFAULT NULL,
  `valor` varchar(25) DEFAULT NULL,
  `usuario_registro` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `Id_Persona` int(11) NOT NULL,
  `Tipo_Persona` int(11) NOT NULL,
  `No_Identidad` bigint(14) NOT NULL,
  `Primer_Nombre` varchar(30) NOT NULL,
  `Segundo_Nombre` varchar(30) NOT NULL,
  `Primer_Apellido` varchar(30) NOT NULL,
  `Segundo_Apellido` varchar(30) NOT NULL,
  `Correo_electronico` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Estado_Civil` varchar(50) NOT NULL,
  `Genero` char(1) NOT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Usuario_Registro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`Id_Persona`, `Tipo_Persona`, `No_Identidad`, `Primer_Nombre`, `Segundo_Nombre`, `Primer_Apellido`, `Segundo_Apellido`, `Correo_electronico`, `Fecha_Nacimiento`, `Estado_Civil`, `Genero`, `Fecha_Registro`, `Usuario_Registro`) VALUES
(1, 1, 80199885998, 'USER', 'TEST', 'PRUEBA', 'CONASYS', 'USER@PRUEBA.COM', '2021-02-01', 'SOLTERO', 'M', '2021-02-18 15:46:56', 'USRRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `ID_pregunta` int(11) NOT NULL,
  `Pregunta` varchar(255) DEFAULT NULL,
  `Usuario_registro` int(11) DEFAULT NULL,
  `Fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `Id_Puesto` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Id_Departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_de_cambios`
--

CREATE TABLE `registro_de_cambios` (
  `fecha_modificacion` date NOT NULL,
  `usuario_registro` varchar(25) NOT NULL,
  `tabla_modificacda` varchar(25) NOT NULL,
  `despues_modificacion` varchar(255) NOT NULL,
  `antes_modificacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestapregunta`
--

CREATE TABLE `respuestapregunta` (
  `Id_respuesta` int(11) NOT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `respuesta` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_rol` int(11) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `ID_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_rol`, `nombre`, `FechaCreacion`, `ID_estado`) VALUES
(1, 'ADMIN', '2021-02-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `separacion_laboral`
--

CREATE TABLE `separacion_laboral` (
  `id_separacion` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_separacion` date NOT NULL,
  `causa` varchar(255) NOT NULL,
  `total_tiempo_trabjado` decimal(25,0) NOT NULL,
  `Total_prestaciones` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitud` int(11) NOT NULL,
  `id_TipoSolicitud` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `concepto` varchar(25) NOT NULL,
  `usuario_registro` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_vacaciones`
--

CREATE TABLE `solicitud_vacaciones` (
  `ID_vacaciones` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_solicitud` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `diasSolicitados` int(11) NOT NULL,
  `Estado_dias_restantes` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `Id_Telefono` int(11) NOT NULL,
  `Id_Persona` int(11) NOT NULL,
  `Numero` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipospersonas`
--

CREATE TABLE `tipospersonas` (
  `Id_Tipo_Persona` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipospersonas`
--

INSERT INTO `tipospersonas` (`Id_Tipo_Persona`, `Descripcion`) VALUES
(1, 'ASPIRANTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_hora`
--

CREATE TABLE `tipos_hora` (
  `Id_tipo_hora` int(11) NOT NULL,
  `Descripcion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_solicitud`
--

CREATE TABLE `tipos_solicitud` (
  `id_TipoSolicitud` int(11) NOT NULL,
  `descripcion_tipoSolicitud` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_transaccion`
--

CREATE TABLE `tipo_transaccion` (
  `Id_Tipo_Transaccion` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Observacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_planilla`
--

CREATE TABLE `transaccion_planilla` (
  `Id_Transaccion` int(11) NOT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Id_Tipo_Transaccion` int(11) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `IHSS` float DEFAULT NULL,
  `RAP` float DEFAULT NULL,
  `Seguro_Vida` float DEFAULT NULL,
  `Pension` float DEFAULT NULL,
  `Prestamo` float DEFAULT NULL,
  `Anticipo` float DEFAULT NULL,
  `Prestaciones` float DEFAULT NULL,
  `Salario_Neto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_tiempo`
--

CREATE TABLE `transaccion_tiempo` (
  `Id_Transaccion_Tiempo` int(11) NOT NULL,
  `Id_Empleado` int(11) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Final` time NOT NULL,
  `Id_Tipo_Hora` int(11) DEFAULT NULL,
  `Observacion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_usuario` int(11) NOT NULL,
  `ID_rol` int(11) DEFAULT NULL,
  `ID_empleado` int(11) DEFAULT NULL,
  `ID_estado` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_primerIngreso` datetime DEFAULT NULL,
  `nom_usuario` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `usuario_registro` varchar(50) DEFAULT NULL,
  `PrimeraVez` varchar(10) NOT NULL DEFAULT 'SI'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`Id_Banco`);

--
-- Indices de la tabla `bonos_estudiantiles`
--
ALTER TABLE `bonos_estudiantiles`
  ADD PRIMARY KEY (`Id_Bono_Estudiantil`),
  ADD KEY `Id_Empleado` (`Id_Empleado`);

--
-- Indices de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD PRIMARY KEY (`Id_Cuenta`),
  ADD KEY `Id_Banco` (`Id_Banco`),
  ADD KEY `Id_Empleado` (`Id_Empleado`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`Id_Departamento`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`Id_Direccion`),
  ADD KEY `Id_Persona` (`Id_Persona`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`ID_Documento`),
  ADD KEY `ID_Documento` (`ID_Documento`,`Id_Tipo_Documento`),
  ADD KEY `Id_Persona` (`Id_Persona`),
  ADD KEY `Id_Tipo_Documento` (`Id_Tipo_Documento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id_Empleado`),
  ADD KEY `Id_Persona` (`Id_Persona`),
  ADD KEY `Id_Grado_Academico` (`Id_Grado_Academico`,`Id_Persona`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `grados_academicos`
--
ALTER TABLE `grados_academicos`
  ADD PRIMARY KEY (`Id_Grado_Academico`);

--
-- Indices de la tabla `historial_puesto_empleado`
--
ALTER TABLE `historial_puesto_empleado`
  ADD PRIMARY KEY (`Id_Historial_Puesto`),
  ADD KEY `Id_Puesto` (`Id_Puesto`),
  ADD KEY `Id_Empleado` (`Id_Empleado`);

--
-- Indices de la tabla `historial_salarios`
--
ALTER TABLE `historial_salarios`
  ADD PRIMARY KEY (`Id_Historial_salario`),
  ADD KEY `Id_Empleado` (`Id_Empleado`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id_parametro`),
  ADD KEY `usuario_registro` (`usuario_registro`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`Id_Persona`),
  ADD KEY `Tipo_Persona` (`Tipo_Persona`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`ID_pregunta`),
  ADD KEY `Usuario_registro` (`Usuario_registro`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`Id_Puesto`),
  ADD UNIQUE KEY `uc_nombre_puesto` (`Nombre`),
  ADD KEY `Id_Departamento` (`Id_Departamento`);

--
-- Indices de la tabla `respuestapregunta`
--
ALTER TABLE `respuestapregunta`
  ADD PRIMARY KEY (`Id_respuesta`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_rol`),
  ADD KEY `ID_estado` (`ID_estado`);

--
-- Indices de la tabla `separacion_laboral`
--
ALTER TABLE `separacion_laboral`
  ADD PRIMARY KEY (`id_separacion`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_TipoSolicitud` (`id_TipoSolicitud`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `usr_registro` (`usuario_registro`);

--
-- Indices de la tabla `solicitud_vacaciones`
--
ALTER TABLE `solicitud_vacaciones`
  ADD PRIMARY KEY (`ID_vacaciones`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`Id_Telefono`),
  ADD KEY `Id_Persona` (`Id_Persona`);

--
-- Indices de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  ADD PRIMARY KEY (`Id_Tipo_Documento`);

--
-- Indices de la tabla `tipospersonas`
--
ALTER TABLE `tipospersonas`
  ADD PRIMARY KEY (`Id_Tipo_Persona`);

--
-- Indices de la tabla `tipos_hora`
--
ALTER TABLE `tipos_hora`
  ADD PRIMARY KEY (`Id_tipo_hora`);

--
-- Indices de la tabla `tipos_solicitud`
--
ALTER TABLE `tipos_solicitud`
  ADD PRIMARY KEY (`id_TipoSolicitud`);

--
-- Indices de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  ADD PRIMARY KEY (`Id_Tipo_Transaccion`);

--
-- Indices de la tabla `transaccion_planilla`
--
ALTER TABLE `transaccion_planilla`
  ADD PRIMARY KEY (`Id_Transaccion`),
  ADD KEY `Id_Empleado` (`Id_Empleado`),
  ADD KEY `Id_Tipo_Transaccion` (`Id_Tipo_Transaccion`);

--
-- Indices de la tabla `transaccion_tiempo`
--
ALTER TABLE `transaccion_tiempo`
  ADD PRIMARY KEY (`Id_Transaccion_Tiempo`),
  ADD KEY `Id_Empleado` (`Id_Empleado`),
  ADD KEY `Id_Tipo_Hora` (`Id_Tipo_Hora`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD KEY `ID_estado` (`ID_estado`),
  ADD KEY `ID_empleado` (`ID_empleado`),
  ADD KEY `ID_rol` (`ID_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `Id_Banco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bonos_estudiantiles`
--
ALTER TABLE `bonos_estudiantiles`
  MODIFY `Id_Bono_Estudiantil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  MODIFY `Id_Cuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `Id_Departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `Id_Direccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `ID_Documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grados_academicos`
--
ALTER TABLE `grados_academicos`
  MODIFY `Id_Grado_Academico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historial_puesto_empleado`
--
ALTER TABLE `historial_puesto_empleado`
  MODIFY `Id_Historial_Puesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_salarios`
--
ALTER TABLE `historial_salarios`
  MODIFY `Id_Historial_salario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id_parametro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `Id_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `ID_pregunta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `Id_Puesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuestapregunta`
--
ALTER TABLE `respuestapregunta`
  MODIFY `Id_respuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `separacion_laboral`
--
ALTER TABLE `separacion_laboral`
  MODIFY `id_separacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud_vacaciones`
--
ALTER TABLE `solicitud_vacaciones`
  MODIFY `ID_vacaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `Id_Telefono` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  MODIFY `Id_Tipo_Documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipospersonas`
--
ALTER TABLE `tipospersonas`
  MODIFY `Id_Tipo_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipos_hora`
--
ALTER TABLE `tipos_hora`
  MODIFY `Id_tipo_hora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_solicitud`
--
ALTER TABLE `tipos_solicitud`
  MODIFY `id_TipoSolicitud` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_transaccion`
--
ALTER TABLE `tipo_transaccion`
  MODIFY `Id_Tipo_Transaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion_planilla`
--
ALTER TABLE `transaccion_planilla`
  MODIFY `Id_Transaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion_tiempo`
--
ALTER TABLE `transaccion_tiempo`
  MODIFY `Id_Transaccion_Tiempo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bonos_estudiantiles`
--
ALTER TABLE `bonos_estudiantiles`
  ADD CONSTRAINT `bonos_estudiantiles_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentas_bancarias`
--
ALTER TABLE `cuentas_bancarias`
  ADD CONSTRAINT `cuentas_bancarias_ibfk_1` FOREIGN KEY (`Id_Banco`) REFERENCES `bancos` (`Id_Banco`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentas_bancarias_ibfk_2` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`Id_Persona`) REFERENCES `personas` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`Id_Persona`) REFERENCES `personas` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documentos_ibfk_2` FOREIGN KEY (`Id_Tipo_Documento`) REFERENCES `tiposdocumentos` (`Id_Tipo_Documento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Id_Persona`) REFERENCES `personas` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`Id_Grado_Academico`) REFERENCES `grados_academicos` (`Id_Grado_Academico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_puesto_empleado`
--
ALTER TABLE `historial_puesto_empleado`
  ADD CONSTRAINT `historial_puesto_empleado_ibfk_1` FOREIGN KEY (`Id_Puesto`) REFERENCES `puestos` (`Id_Puesto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_puesto_empleado_ibfk_2` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_salarios`
--
ALTER TABLE `historial_salarios`
  ADD CONSTRAINT `historial_salarios_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD CONSTRAINT `parametros_ibfk_1` FOREIGN KEY (`usuario_registro`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`Tipo_Persona`) REFERENCES `tipospersonas` (`Id_Tipo_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`Usuario_registro`) REFERENCES `usuarios` (`ID_usuario`);

--
-- Filtros para la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentos` (`Id_Departamento`);

--
-- Filtros para la tabla `respuestapregunta`
--
ALTER TABLE `respuestapregunta`
  ADD CONSTRAINT `respuestapregunta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`ID_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `respuestapregunta_ibfk_2` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`ID_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `separacion_laboral`
--
ALTER TABLE `separacion_laboral`
  ADD CONSTRAINT `separacion_laboral_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`id_TipoSolicitud`) REFERENCES `tipos_solicitud` (`id_TipoSolicitud`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud_vacaciones`
--
ALTER TABLE `solicitud_vacaciones`
  ADD CONSTRAINT `solicitud_vacaciones_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`Id_Persona`) REFERENCES `personas` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transaccion_planilla`
--
ALTER TABLE `transaccion_planilla`
  ADD CONSTRAINT `transaccion_planilla_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaccion_planilla_ibfk_2` FOREIGN KEY (`Id_Tipo_Transaccion`) REFERENCES `tipo_transaccion` (`Id_Tipo_Transaccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transaccion_tiempo`
--
ALTER TABLE `transaccion_tiempo`
  ADD CONSTRAINT `transaccion_tiempo_ibfk_1` FOREIGN KEY (`Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaccion_tiempo_ibfk_2` FOREIGN KEY (`Id_Tipo_Hora`) REFERENCES `tipos_hora` (`Id_tipo_hora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_5` FOREIGN KEY (`ID_estado`) REFERENCES `estados` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_6` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`Id_Empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_7` FOREIGN KEY (`ID_rol`) REFERENCES `roles` (`ID_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
