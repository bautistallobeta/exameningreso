import pool from '../db.js'; 

// Funcion que llama al procedimiento para realizar reservas
export const reservarFuncion = async (req, res) => {
    const { IdFuncion, Cantidad, DNI } = req.body;

    // Controles de parametros de entrada
    // Campos no nulos
    if (!IdFuncion || !Cantidad || !DNI) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }
    // Campos del tipo y formato correcto
    if (isNaN(Number(IdFuncion))) {
        return res.status(400).json({ error: 'IdFuncion debe ser un número' });
    }
    if (isNaN(Number(Cantidad))) {
        return res.status(400).json({ error: 'Cantidad debe ser un número' });
    }
    if (Cantidad <= 0) {
        return res.status(400).json({ error: 'Cantidad debe ser mayor a 0' });
    }

    // Llamada al stored procedure
    try {
        const [resultados] = await pool.query('CALL ReservarFuncion(?, ?, ?)', [IdFuncion, Cantidad, DNI]);
        res.send([resultados][0][0]); 
    } catch (err) {
        // Si el error viene dado por alguno de los SIGNAL en MySQL, devuelve ese mensaje
        if (err.code === 'ER_SIGNAL_EXCEPTION') {
            return res.status(400).json({ error: err.sqlMessage });
        }
        res.status(500).json({ error: 'Error en la base de datos' });
    }
};
