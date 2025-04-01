import express from 'express';
import { reservarFuncion } from '../controllers/reservasController.js';

const router = express.Router();


/**
 * @swagger
 * /reservas:
 *   post:
 *     summary: Reserva una función de cine
 *     requestBody:
 *       required: true
 *       description: Información de la reserva a realizar
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               IdFuncion:
 *                 type: integer
 *                 example: 1
 *               Cantidad:
 *                 type: integer
 *                 example: 2
 *               DNI:
 *                type: string
 *                example: "12345678"
 *     responses:
 *       200:
 *         description: Reserva realizada con éxito  
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: "OK"
 *       400:
 *         description: Error en la solicitud (campos faltantes, valores inválidos o errores del procedimiento almacenado)
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Todos los campos son obligatorios"
 *       500:
 *         description: Error en la base de datos
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: "Error en la base de datos"
 */

router.post('/', reservarFuncion);

export default router;