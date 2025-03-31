import pool from '../db.js'; 

// Funcion que llama al procedimiento para obtener las peliculas en proyeccion por su fecha
export const getPeliculasEnProyeccion = async (req, res) => {
    const fecha = req.params.fecha; 
    try {
        const [resultados] = await pool.query('CALL PeliculasEnProyeccion(?)', [fecha]);  
        res.json(resultados[0]);  
    } catch (err) {
        console.error('Error en el stored procedure:', err);
        res.status(500).send('Error en la DB');
    }
};

// Función que llama al procedimeinto para obtener una pelicula por su Id
export const getPeliculaPorId = async (req, res) => {
    const idPelicula = req.params.id; 
    try {
        const [resultados] = await pool.query('CALL PeliculaPorId(?)', parseInt([idPelicula])); 
        res.json(resultados[0]);  
    } catch (err) {
        console.error('Error en el stored procedure:', err);
        res.status(500).send('Error en la DB');
    }
};