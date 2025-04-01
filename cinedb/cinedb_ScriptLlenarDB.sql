INSERT INTO Generos (IdGenero, Genero, Estado) VALUES
(1, 'Acción', 'A'),
(2, 'Comedia', 'A'),
(3, 'Drama', 'A'),
(4, 'Terror', 'A'),
(5, 'Ciencia Ficción', 'A');

INSERT INTO Salas (IdSala, Sala, TipoSala, Direccion, Estado, Observaciones) VALUES
(1, 'Sala 1', 'A', 'Monteagudo 250', 'A', NULL),
(2, 'Sala 2', 'B', 'Monteagudo 250', 'A', NULL),
(3, 'Sala 3', 'C', 'Monteagudo 250', 'I', 'Pantalla en reparación'),
(4, 'Sala 4', 'A', '24 de Septiembre 757', 'A', NULL),
(5, 'Sala 5', 'B', '24 de Septiembre 757', 'A', NULL);

INSERT INTO Peliculas (IdPelicula, IdGenero, Pelicula, Sinopsis, Duracion, Actores, Estado, Observaciones) VALUES
(1, 5, 'Volver al Futuro', 'Un adolescente es enviado accidentalmente 30 años al pasado en un DeLorean modificado por un excéntrico científico.', 116, 'Michael J. Fox, Christopher Lloyd, Lea Thompson', 'A', NULL),
(2, 5, 'Jurassic Park', 'Un millonario crea un parque con dinosaurios clonados, pero la seguridad falla y los depredadores quedan libres.', 127, 'Sam Neill, Laura Dern, Jeff Goldblum', 'A', NULL),
(3, 1, 'Duro de Matar', 'Un policía de Nueva York queda atrapado en un edificio con terroristas y debe salvar a los rehenes.', 132, 'Bruce Willis, Alan Rickman, Bonnie Bedelia', 'A', NULL),
(4, 4, 'El Exorcista', 'Una niña es poseída por una entidad demoníaca, y su madre recurre a dos sacerdotes para salvarla.', 122, 'Ellen Burstyn, Max von Sydow, Linda Blair', 'A', 'Versión remasterizada en 4K'),
(5, 3, 'Forrest Gump', 'Un hombre con discapacidad intelectual presencia y participa en eventos clave de la historia de EE.UU.', 142, 'Tom Hanks, Robin Wright, Gary Sinise', 'A', NULL);

INSERT INTO Butacas (IdButaca, IdSala, NroButaca, Fila, Columna, Estado, Observaciones) VALUES
-- Sala 1
(1, 1, 1, 1, 1, 'A', NULL),
(2, 1, 2, 1, 2, 'A', NULL),
(3, 1, 3, 2, 1, 'A', NULL),
(4, 1, 4, 2, 2, 'A', NULL),
(5, 1, 5, 3, 1, 'I', 'Butaca rota'),
-- Sala 2
(6, 2, 1, 1, 1, 'A', NULL),
(7, 2, 2, 1, 2, 'A', NULL),
(8, 2, 3, 2, 1, 'A', NULL),
(9, 2, 4, 2, 2, 'A', NULL),
(10, 2, 5, 3, 1, 'A', NULL),
-- Sala 3
(11, 3, 1, 1, 1, 'A', NULL),
(12, 3, 2, 1, 2, 'A', NULL),
(13, 3, 3, 2, 1, 'I', 'Requiere mantenimiento'),
(14, 3, 4, 2, 2, 'A', NULL),
(15, 3, 5, 3, 1, 'A', NULL),
-- Sala 4
(16, 4, 1, 1, 1, 'A', NULL),
(17, 4, 2, 1, 2, 'A', NULL),
(18, 4, 3, 2, 1, 'A', NULL),
(19, 4, 4, 2, 2, 'A', NULL),
(20, 4, 5, 3, 1, 'A', NULL),
-- Sala 5
(21, 5, 1, 1, 1, 'A', NULL),
(22, 5, 2, 1, 2, 'A', NULL),
(23, 5, 3, 2, 1, 'A', NULL),
(24, 5, 4, 2, 2, 'A', NULL),
(25, 5, 5, 3, 1, 'I', 'Requiere mantenimiento');


INSERT INTO Funciones (IdPelicula, IdSala, FechaProbableInicio, FechaProbableFin, FechaInicio, FechaFin, Precio, Estado, Observaciones) VALUES
(3, 3, '2025-03-30 18:00:00', '2025-03-30 20:12:00', '2025-03-30 18:00:00', '2025-03-30 20:12:00', 1100, 'A', NULL),
(4, 4, '2025-03-30 19:00:00', '2025-03-30 21:07:00', '2025-03-30 19:00:00', '2025-03-30 21:07:00', 1000, 'A', NULL),
(5, 5, '2025-03-30 20:30:00', '2025-03-30 22:52:00', '2025-03-30 20:30:00', '2025-03-30 22:52:00', 1000, 'A', 'Proyección con retraso técnico'),
(1, 1, '2025-03-30 21:00:00', '2025-03-30 23:56:00', '2025-03-30 21:00:00', '2025-03-30 23:56:00', 1100, 'A', NULL),
(4, 1, '2025-03-30 19:00:00', '2025-03-30 21:02:00', '2025-03-30 19:00:00', '2025-03-30 21:02:00', 1000, 'A', NULL),
(2, 5, '2025-03-30 23:30:00', '2025-03-31 01:37:00', '2025-03-30 23:30:00', '2025-03-31 01:37:00', 1000, 'A', 'Proyección con retraso técnico'),
(3, 1, '2025-03-30 18:00:00', '2025-03-30 20:12:00', '2025-03-30 18:00:00', '2025-03-30 20:12:00', 1100, 'A', NULL),
(5, 2, '2025-03-30 19:00:00', '2025-03-30 21:22:00', '2025-03-30 19:00:00', '2025-03-30 21:22:00', 1000, 'A', NULL),
(5, 2, '2025-03-30 22:30:00', '2025-03-31 00:12:00', '2025-03-30 22:30:00', '2025-03-31 00:12:00', 1000, 'A', 'Proyección con retraso técnico'),

(3, 3, '2025-03-31 18:00:00', '2025-03-31 20:12:00', '2025-03-31 18:00:00', '2025-03-31 20:12:00', 1100, 'A', NULL),
(4, 4, '2025-03-31 19:00:00', '2025-03-31 21:07:00', '2025-03-31 19:00:00', '2025-03-31 21:07:00', 1000, 'A', NULL),
(5, 5, '2025-03-31 20:30:00', '2025-03-31 22:52:00', '2025-03-31 20:30:00', '2025-03-31 22:52:00', 1000, 'A', 'Proyección con retraso técnico'),
(1, 1, '2025-03-31 21:00:00', '2025-03-31 23:56:00', '2025-03-31 21:00:00', '2025-03-31 23:56:00', 1100, 'A', NULL),
(4, 1, '2025-03-31 19:00:00', '2025-03-31 21:02:00', '2025-03-31 19:00:00', '2025-03-31 21:02:00', 1000, 'A', NULL),
(2, 5, '2025-03-31 23:30:00', '2025-04-01 01:37:00', '2025-03-31 23:30:00', '2025-04-01 01:37:00', 1000, 'A', 'Proyección con retraso técnico'),
(3, 1, '2025-03-31 18:00:00', '2025-03-31 20:12:00', '2025-03-31 18:00:00', '2025-03-31 20:12:00', 1100, 'A', NULL),
(5, 2, '2025-03-31 19:00:00', '2025-03-31 21:22:00', '2025-03-31 19:00:00', '2025-03-31 21:22:00', 1000, 'A', NULL),
(5, 2, '2025-03-31 22:30:00', '2025-04-01 00:12:00', '2025-03-31 22:30:00', '2025-04-01 00:12:00', 1000, 'A', 'Proyección con retraso técnico'),

(3, 3, '2025-04-01 18:00:00', '2025-04-01 20:12:00', '2025-04-01 18:00:00', '2025-04-01 20:12:00', 1100, 'A', NULL),
(4, 4, '2025-04-01 19:00:00', '2025-04-01 21:07:00', '2025-04-01 19:00:00', '2025-04-01 21:07:00', 1000, 'A', NULL),
(5, 5, '2025-04-01 20:30:00', '2025-04-01 22:52:00', '2025-04-01 20:30:00', '2025-04-01 22:52:00', 1000, 'A', 'Proyección con retraso técnico'),
(1, 1, '2025-04-01 21:00:00', '2025-04-01 23:56:00', '2025-04-01 21:00:00', '2025-04-01 23:56:00', 1100, 'A', NULL),
(4, 1, '2025-04-01 19:00:00', '2025-04-01 21:02:00', '2025-04-01 19:00:00', '2025-04-01 21:02:00', 1000, 'A', NULL),
(2, 5, '2025-04-01 23:30:00', '2025-04-02 01:37:00', '2025-04-01 23:30:00', '2025-04-02 01:37:00', 1000, 'A', 'Proyección con retraso técnico'),
(3, 1, '2025-04-01 18:00:00', '2025-04-01 20:12:00', '2025-04-01 18:00:00', '2025-04-01 20:12:00', 1100, 'A', NULL),
(5, 2, '2025-04-01 19:00:00', '2025-04-01 21:22:00', '2025-04-01 19:00:00', '2025-04-01 21:22:00', 1000, 'A', NULL),
(5, 2, '2025-04-01 22:30:00', '2025-04-02 00:12:00', '2025-04-01 22:30:00', '2025-04-02 00:12:00', 1000, 'A', 'Proyección con retraso técnico');

INSERT INTO Reservas (IdFuncion, IdPelicula, IdSala, IdButaca, DNI, FechaAlta, FechaBaja, EstaPagada, Observaciones) VALUES
-- Función 1: Película 3 en Sala 3 (reserva en butaca activa)
(1, 3, 3, 11, 12345678, '2025-03-28 10:00:00', NULL, 'P', NULL),
-- Función 2: Película 4 en Sala 4 (reserva en butaca activa)
(2, 4, 4, 16, 23456789, '2025-03-28 11:00:00', NULL, 'N', 'Pago pendiente'),
-- Función 3: Película 5 en Sala 5 (reserva en butaca activa)
(3, 5, 5, 21, 34567890, '2025-03-28 12:00:00', NULL, 'P', NULL),
-- Función 4: Película 1 en Sala 1 (reserva en butaca activa)
(4, 1, 1, 1, 45678901, '2025-03-28 13:00:00', NULL, 'P', NULL),
-- Función 5: Película 4 en Sala 1 (reserva en butaca activa)
(5, 4, 1, 2, 56789012, '2025-03-28 14:00:00', NULL, 'N', 'Pago pendiente'),
-- Función 6: Película 2 en Sala 5 (reserva en butaca activa)
(6, 2, 5, 22, 67890123, '2025-03-28 15:00:00', NULL, 'P', NULL),
-- Función 7: Película 3 en Sala 1 (reserva en butaca activa)
(7, 3, 1, 3, 78901234, '2025-03-28 16:00:00', NULL, 'P', NULL),
-- Función 8: Película 5 en Sala 2 (reserva en butaca activa)
(8, 5, 2, 6, 89012345, '2025-03-28 17:00:00', NULL, 'N', 'Pago pendiente'),
-- Función 9: Película 5 en Sala 2 (reserva en butaca activa)
(9, 5, 2, 7, 90123456, '2025-03-28 18:00:00', NULL, 'P', NULL);
