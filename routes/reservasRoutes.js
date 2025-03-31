import express from 'express';
//import { } from '../controllers/reservasController.js';

const router = express.Router();

router.get('/', (req, res) => {
    res.send('Reservas endpoint');
});

export default router;