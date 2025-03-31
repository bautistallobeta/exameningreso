import express from 'express';
import peliculasRoutes from './routes/peliculasRoutes.js'
import reservasRoutes from './routes/reservasRoutes.js'


const app = express();
const PORT = 8080;

app.use(express.json()); // middleware para que se parsee el json que viene en el body antes que se ejecute la ufncion callback del 

app.listen(PORT, () => {
    console.log('Servidor corriendo en http://localhost:'+ PORT);
})

app.get('/', (req, res) => {
    res.send('Servidor corriendo');
})

app.use('/peliculas', peliculasRoutes); 

app.use('/reservas', reservasRoutes);
