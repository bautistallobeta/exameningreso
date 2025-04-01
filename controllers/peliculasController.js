import pool from '../db.js'; 

// Función para llamar al procedimiento para obtener las peliculas en proyeccion por su fecha
export const getPeliculasEnProyeccion = async (req, res) => {
    const fecha = req.params.fecha; 
    try {
        const [resultados] = await pool.query('CALL PeliculasEnProyeccion(?)', [fecha]);  
        if (resultados[0].length === 0) {
            return res.status(404).json({ error: 'No se encontraron funciones para esa fecha' });
        }
        res.json(resultados[0]);  
    } catch (err) {
        res.status(500).send('Error en la DB');
    }
};

// Función para llamar al procedimeinto para obtener una pelicula por su Id
export const getPeliculaPorId = async (req, res) => {
    const idPelicula = req.params.id; 
    try {
        const [resultados] = await pool.query('CALL PeliculaPorId(?)', parseInt([idPelicula])); 
        if (resultados[0].length === 0) {
            return res.status(404).json({ error: 'Película no encontrada' });
        }
        res.json(resultados[0]);  
    } catch (err) {
        res.status(500).send('Error en la DB');
    }
};