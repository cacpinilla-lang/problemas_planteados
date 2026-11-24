-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 05:14:00
-- Versión del servidor: 10.11.16-MariaDB
-- Versión de PHP: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_sena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_prestamo`
--

CREATE TABLE `tb_detalle_prestamo` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Recurso` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT 1,
  `Observaciones` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalle_prestamo`
--

INSERT INTO `tb_detalle_prestamo` (`ID_Detalle`, `ID_Prestamo`, `ID_Recurso`, `Cantidad`, `Observaciones`) VALUES
(1, 1, 1, 1, 'Entregado en buen estado'),
(2, 2, 3, 1, 'Cargador incluido'),
(3, 3, 4, 1, 'Con maletin y cargador'),
(4, 4, 5, 1, 'Con cable HDMI'),
(5, 5, 2, 1, 'Libro de matematicas'),
(6, 6, 6, 1, 'Libro de programacion'),
(7, 7, 7, 1, 'Para examen practico'),
(8, 8, 9, 1, 'Devolver antes de finalizar la semana'),
(9, 9, 10, 1, 'Lectura rapida'),
(10, 10, 8, 1, 'Cámara fotografica en estuche');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_personal_biblioteca`
--

CREATE TABLE `tb_personal_biblioteca` (
  `ID_Personal` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  `Turno` enum('Mañana','Tarde','Noche') NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_personal_biblioteca`
--

INSERT INTO `tb_personal_biblioteca` (`ID_Personal`, `Nombre`, `Cargo`, `Turno`, `Email`) VALUES
(1, 'Ana Martinez', 'Bibliotecaria Principal', 'Mañana', 'amartinez@sena.edu.co'),
(2, 'Pedro Garcia', 'Auxiliar de Equipos', 'Tarde', 'pgarcia@sena.edu.co'),
(3, 'Luisa Fernanda', 'Asistente', 'Noche', 'lfernanda@sena.edu.co'),
(4, 'Mario Gomez', 'Administrador de Inventario', 'Mañana', 'mgomez.admin@sena.edu.co'),
(5, 'Clara Rojas', 'Auxiliar de Biblioteca', 'Tarde', 'crojas@sena.edu.co'),
(6, 'Jose Ortiz', 'Tecnico de Equipos', 'Mañana', 'jortiz@sena.edu.co'),
(7, 'Martha Beltran', 'Atencion al Usuario', 'Noche', 'mbeltran@sena.edu.co'),
(8, 'Jorge Silva', 'Auxiliar General', 'Tarde', 'jsilva@sena.edu.co'),
(9, 'Helena Mora', 'Coordinadora de Recursos', 'Mañana', 'hmora@sena.edu.co'),
(10, 'Oscar Sanchez', 'Supervisor', 'Tarde', 'osanchez@sena.edu.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_prestamos`
--

CREATE TABLE `tb_prestamos` (
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Fecha_Prestamo` datetime NOT NULL DEFAULT current_timestamp(),
  `Fecha_Devolucion_Prevista` datetime NOT NULL,
  `Estado_Prestamo` enum('Activo','Devuelto','Vencido') DEFAULT 'Activo',
  `ID_Personal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_prestamos`
--

INSERT INTO `tb_prestamos` (`ID_Prestamo`, `ID_Usuario`, `Fecha_Prestamo`, `Fecha_Devolucion_Prevista`, `Estado_Prestamo`, `ID_Personal`) VALUES
(1, 1, '2026-11-20 08:00:00', '2026-11-22 08:00:00', 'Vencido', 1),
(2, 2, '2026-11-21 09:30:00', '2026-11-24 09:30:00', 'Activo', 2),
(3, 3, '2026-11-22 10:00:00', '2026-11-25 10:00:00', 'Activo', 1),
(4, 4, '2026-11-23 11:15:00', '2026-11-24 11:15:00', 'Activo', 3),
(5, 5, '2026-11-23 14:00:00', '2026-11-26 14:00:00', 'Activo', 4),
(6, 6, '2026-11-19 07:45:00', '2026-11-21 07:45:00', 'Devuelto', 1),
(7, 7, '2026-11-18 15:30:00', '2026-11-20 15:30:00', 'Devuelto', 2),
(8, 8, '2026-11-22 13:00:00', '2026-11-24 13:00:00', 'Activo', 5),
(9, 9, '2026-11-23 09:00:00', '2026-11-26 09:00:00', 'Activo', 1),
(10, 10, '2026-11-22 16:30:00', '2026-11-23 16:30:00', 'Vencido', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_recursos_biblioteca`
--

CREATE TABLE `tb_recursos_biblioteca` (
  `ID_Recurso` int(11) NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `Autor_Marca` varchar(100) NOT NULL,
  `Tipo_Recurso` enum('Libro','Equipo') NOT NULL,
  `Estado` enum('Disponible','Prestado','En Mantenimiento','Dañado') DEFAULT 'Disponible',
  `Ubicacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_recursos_biblioteca`
--

INSERT INTO `tb_recursos_biblioteca` (`ID_Recurso`, `Titulo`, `Autor_Marca`, `Tipo_Recurso`, `Estado`, `Ubicacion`) VALUES
(1, 'Cien años de soledad', 'Gabriel Garcia Marquez', 'Libro', 'Disponible', 'Estante A-1'),
(2, 'Calculo Trascendentes Tempranas', 'James Stewart', 'Libro', 'Disponible', 'Estante B-3'),
(3, 'Portatil Lenovo ThinkPad', 'Lenovo', 'Equipo', 'Disponible', 'Armario Equipos 1'),
(4, 'Portatil HP ProBook', 'HP', 'Equipo', 'Prestado', 'Armario Equipos 1'),
(5, 'Video Proyector Epson', 'Epson', 'Equipo', 'Disponible', 'Armario Equipos 2'),
(6, 'Introduccion a las Bases de Datos', 'C.J. Date', 'Libro', 'Disponible', 'Estante C-2'),
(7, 'Portatil Dell Latitude', 'Dell', 'Equipo', 'Disponible', 'Armario Equipos 1'),
(8, 'Camara Canon EOS', 'Canon', 'Equipo', 'En Mantenimiento', 'Estante Especiales'),
(9, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Libro', 'Disponible', 'Estante A-2'),
(10, 'El caballero de la armadura oxidada', 'Robert Fisher', 'Libro', 'Disponible', 'Estante A-3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sanciones`
--

CREATE TABLE `tb_sanciones` (
  `ID_Sancion` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Prestamo` int(11) NOT NULL,
  `Motivo` varchar(255) NOT NULL,
  `Monto` decimal(10,2) DEFAULT 0.00,
  `Estado_Pago` enum('Pendiente','Pagado','Anulado') DEFAULT 'Pendiente',
  `Fecha_Sancion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_sanciones`
--

INSERT INTO `tb_sanciones` (`ID_Sancion`, `ID_Usuario`, `ID_Prestamo`, `Motivo`, `Monto`, `Estado_Pago`, `Fecha_Sancion`) VALUES
(1, 1, 1, 'Entrega de libro con un dia de retraso', 5000.00, 'Pendiente', '2026-11-23 23:07:07'),
(2, 2, 2, 'Ninguno', 0.00, 'Anulado', '2026-11-23 23:07:07'),
(3, 10, 10, 'Retraso de entrega de camara', 12000.00, 'Pendiente', '2026-11-23 23:07:07'),
(4, 5, 5, 'Faltaba cargador en entrega previa', 3000.00, 'Pagado', '2026-11-23 23:07:07'),
(5, 1, 1, 'Maltrato leve de paginas', 8000.00, 'Pendiente', '2026-11-23 23:07:07'),
(6, 3, 3, 'Ninguno', 0.00, 'Anulado', '2026-11-23 23:07:07'),
(7, 4, 4, 'Ninguno', 0.00, 'Anulado', '2026-11-23 23:07:07'),
(8, 6, 6, 'Retraso de 2 horas', 2000.00, 'Pagado', '2026-11-23 23:07:07'),
(9, 7, 7, 'Ninguno', 0.00, 'Anulado', '2026-11-23 23:07:07'),
(10, 8, 8, 'Ninguno', 0.00, 'Anulado', '2026-11-23 23:07:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Tipo_Usuario` enum('Aprendiz','Instructor','Administrativo') NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`ID_Usuario`, `Nombre`, `Tipo_Usuario`, `Correo`, `Telefono`) VALUES
(1, 'Cristian Colorado', 'Aprendiz', 'ccolorado@sena.edu.co', '3101234567'),
(2, 'Felipe Mendez', 'Aprendiz', 'fmendez@sena.edu.co', '3112345678'),
(3, 'Julian Reyes', 'Aprendiz', 'jreyes@sena.edu.co', '3123456789'),
(4, 'Daniela Rodriguez', 'Aprendiz', 'drodriguez@sena.edu.co', '3134567890'),
(5, 'Juan Vargas', 'Aprendiz', 'jvargas@sena.edu.co', '3145678901'),
(6, 'Carlos Perez', 'Instructor', 'cperez@sena.edu.co', '3156789012'),
(7, 'Maria Gomez', 'Instructor', 'mgomez@sena.edu.co', '3167890123'),
(8, 'Laura Castro', 'Aprendiz', 'lcastro@sena.edu.co', '3178901234'),
(9, 'Andres Diaz', 'Aprendiz', 'adiaz@sena.edu.co', '3189012345'),
(10, 'Sofia Ruiz', 'Administrativo', 'sruiz@sena.edu.co', '3190123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_detalle_prestamo`
--
ALTER TABLE `tb_detalle_prestamo`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Prestamo` (`ID_Prestamo`),
  ADD KEY `ID_Recurso` (`ID_Recurso`);

--
-- Indices de la tabla `tb_personal_biblioteca`
--
ALTER TABLE `tb_personal_biblioteca`
  ADD PRIMARY KEY (`ID_Personal`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `tb_prestamos`
--
ALTER TABLE `tb_prestamos`
  ADD PRIMARY KEY (`ID_Prestamo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Personal` (`ID_Personal`);

--
-- Indices de la tabla `tb_recursos_biblioteca`
--
ALTER TABLE `tb_recursos_biblioteca`
  ADD PRIMARY KEY (`ID_Recurso`);

--
-- Indices de la tabla `tb_sanciones`
--
ALTER TABLE `tb_sanciones`
  ADD PRIMARY KEY (`ID_Sancion`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Prestamo` (`ID_Prestamo`);

--
-- Indices de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_detalle_prestamo`
--
ALTER TABLE `tb_detalle_prestamo`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_personal_biblioteca`
--
ALTER TABLE `tb_personal_biblioteca`
  MODIFY `ID_Personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_prestamos`
--
ALTER TABLE `tb_prestamos`
  MODIFY `ID_Prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_recursos_biblioteca`
--
ALTER TABLE `tb_recursos_biblioteca`
  MODIFY `ID_Recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_sanciones`
--
ALTER TABLE `tb_sanciones`
  MODIFY `ID_Sancion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_detalle_prestamo`
--
ALTER TABLE `tb_detalle_prestamo`
  ADD CONSTRAINT `tb_detalle_prestamo_ibfk_1` FOREIGN KEY (`ID_Prestamo`) REFERENCES `tb_prestamos` (`ID_Prestamo`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_detalle_prestamo_ibfk_2` FOREIGN KEY (`ID_Recurso`) REFERENCES `tb_recursos_biblioteca` (`ID_Recurso`);

--
-- Filtros para la tabla `tb_prestamos`
--
ALTER TABLE `tb_prestamos`
  ADD CONSTRAINT `tb_prestamos_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `tb_usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `tb_prestamos_ibfk_2` FOREIGN KEY (`ID_Personal`) REFERENCES `tb_personal_biblioteca` (`ID_Personal`);

--
-- Filtros para la tabla `tb_sanciones`
--
ALTER TABLE `tb_sanciones`
  ADD CONSTRAINT `tb_sanciones_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `tb_usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `tb_sanciones_ibfk_2` FOREIGN KEY (`ID_Prestamo`) REFERENCES `tb_prestamos` (`ID_Prestamo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
