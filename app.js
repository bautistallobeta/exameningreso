import express from 'express';
import swaggerDocs from './swaggerConfig.js';
import peliculasRoutes from './routes/peliculasRoutes.js'
import reservasRoutes from './routes/reservasRoutes.js'
import dotenv from 'dotenv';

// Carga las variables del .env
dotenv.config();  

const app = express();

const PORT = process.env.PORT || 8080;;

// Middleware para parsear el json que llega en el body 
app.use(express.json()); 

// Inicializa Swagger
swaggerDocs(app);

// Ruta para probar que funciona
app.get('/', (req, res) => {
    res.send('App corriendo');
})

app.use('/peliculas', peliculasRoutes); 

app.use('/reservas', reservasRoutes);

app.listen(PORT, () => {
    console.log('Servidor corriendo en http://localhost:'+ PORT);
    console.log('Documentación Swagger en http://localhost:'+ PORT + '/api-docs');
})

