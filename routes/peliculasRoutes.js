import express from 'express';
import { getPeliculasEnProyeccion, getPeliculaPorId } from '../controllers/peliculasController.js';

const router = express.Router();

//El control para saber si es fecha o id se hace mediante expresiones regulares en las rutas


/**
 * @swagger
 * /peliculas/{fecha}:
 *   get:
 *     summary: Obtiene las funciones en cartelera según la fecha ingresada
 *     parameters:
 *       - in: path
 *         name: fecha
 *         required: true
 *         description: Fecha en formato YYYY-MM-DD
 *         schema:
 *           type: string
 *           format: date
 *     responses:
 *       200:
 *         description: Lista de funciones para la fecha indicada
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               items:
 *                 type: object
 *               properties:
 *                 IdFuncion:
 *                   type: integer
 *                   example: 19
 *                 IdPelicula:
 *                   type: integer
 *                   example: 3
 *                 IdSala:
 *                   type: integer
 *                   example: 3
 *                 Sala:
 *                   type: string
 *                   example: "Sala 3"
 *                 Pelicula:
 *                   type: string
 *                   example: "Duro de Matar"
 *                 FechaInicio:
 *                   type: string
 *                   format: date-time
 *                   example: "2025-04-01T18:00:00.000Z"
 *                 Precio:
 *                   type: string
 *                   example: "1100.00"
 *       404:
 *         description: Funciones no encontradas
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "No se encontraron funciones para esa fecha"
 *       500:
 *         description: Error en la base de datos
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Error en la DB"
 */
// Ruta para obtener las películas en proyección segun la fecha
router.get('/:fecha([0-9]{4}-[0-9]{2}-[0-9]{2})', getPeliculasEnProyeccion);


/**
 * @swagger
 * /peliculas/{id}:
 *   get:
 *     summary: Obtiene informacion relevante sobre pelicula con el id ingresado
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: Id de la película
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Informacion relevante de la película con el Id ingresado
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 IdPelicula:
 *                   type: integer
 *                   example: 1
 *                 Pelicula:
 *                   type: string
 *                   example: "Volver al Futuro"
 *                 Sinopsis:
 *                   type: string
 *                   example: "Un adolescente es enviado accidentalmente 30 años al pasado en un DeLorean modificado por un excéntrico científico."
 *                 Duracion:
 *                   type: integer
 *                   example: 116
 *                 Actores:
 *                   type: string
 *                   example: "Michael J. Fox, Christopher Lloyd, Lea Thompson"
 *                 Estado:
 *                   type: string
 *                   example: "A"
 *                 Observaciones:
 *                   type: string
 *                   example: null
 *                 Genero:
 *                   type: string
 *                   example: "Ciencia Ficción"
 *       404:
 *         description: No se encontró la pelicula con el Id ingresado
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Película no encontrada"
 *       500:
 *         description: Error en la base de datos
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Error en la DB"
 */

// Ruta para obtener una película por su ID
router.get('/:id([0-9]+)', getPeliculaPorId);

export default router;