const express = require('express');
const app = express();
const PORT = 8080;

app.use(express.json()); // middleware para que se parsee el json que viene en el body antes que se ejecute la ufncion callback del 

app.listen(PORT, () => {
    console.log('Servidor corriendo en http://localhost:'+ PORT);
})

app.get('/', (req, res) => {
    res.send('Servidor corriendo');
})

app.get('/peliculas/:fecha', (req, res) => {
    const fecha = req.params.fecha;
    const peliculas = [
        { nombre: 'Avatar', fecha: '2023-10-01' },
        { nombre: 'Avengers', fecha: '2023-10-02' },
        { nombre: 'Titanic', fecha: '2023-10-03' },
    ];
    const peliculasFiltradas = peliculas.filter(pelicula => pelicula.fecha === fecha);
    res.json(peliculasFiltradas);
});