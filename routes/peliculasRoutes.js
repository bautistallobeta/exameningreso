import express from 'express';
import { getPeliculasEnProyeccion, getPeliculaPorId } from '../controllers/peliculasController.js';

const router = express.Router();

//El control para saber si es fecha o id se hace mediante expresiones regulares en las rutas

// Ruta para obtener las películas en proyección segun la fecha
router.get('/:fecha([0-9]{4}-[0-9]{2}-[0-9]{2})', getPeliculasEnProyeccion);

// Ruta para obtener una película por su ID
router.get('/:id([0-9]+)', getPeliculaPorId);

export default router;