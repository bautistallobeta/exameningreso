import express from 'express';
import { reservarFuncion } from '../controllers/reservasController.js';

const router = express.Router();

router.post('/', reservarFuncion);

export default router;