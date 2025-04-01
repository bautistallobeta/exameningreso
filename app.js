import express from 'express';
import peliculasRoutes from './routes/peliculasRoutes.js'
import reservasRoutes from './routes/reservasRoutes.js'

const app = express();

const PORT = 8080;

// Middleware para parsear el json que llega en el body 
app.use(express.json()); 

app.listen(PORT, () => {
    console.log('Servidor corriendo en http://localhost:'+ PORT);
})

// Ruta para probar que funciona
app.get('/', (req, res) => {
    res.send('App corriendo');
})

app.use('/peliculas', peliculasRoutes); 

app.use('/reservas', reservasRoutes);
