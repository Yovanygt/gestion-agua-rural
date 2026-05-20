const pool = require('../config/db');

const obtenerResumen = async (req, res) => {

    try {

        const dbActual = await pool.query(
            'SELECT current_database()'
        );

        console.log(dbActual.rows);

        const familias = await pool.query(
            'SELECT COUNT(*) FROM public.familias'
        );

        const incidencias = await pool.query(
            "SELECT COUNT(*) FROM public.incidencias WHERE estado = 'PENDIENTE'"
        );

        const sectores = await pool.query(
            'SELECT COUNT(*) FROM public.sectores'
        );

        res.json({
            familias: familias.rows[0].count,
            incidencias: incidencias.rows[0].count,
            sectores: sectores.rows[0].count
        });

    } catch(error) {

        console.error(error.message);

        res.status(500).json({
            error: 'Error dashboard'
        });
    }
};

module.exports = {
    obtenerResumen
};