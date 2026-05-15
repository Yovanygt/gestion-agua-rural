const db = require('../config/db');

const registrarIncidencia = async (req, res) => {
    try {
        const {
            familia_id,
            tipo,
            descripcion,
            estado
        } = req.body;

        if (!familia_id || !tipo || !descripcion) {
            return res.status(400).json({
                ok: false,
                message: 'Familia, tipo y descripción son obligatorios'
            });
        }

        const [familia] = await db.query(
            'SELECT * FROM familias WHERE id = ?',
            [familia_id]
        );

        if (familia.length === 0) {
            return res.status(404).json({
                ok: false,
                message: 'La familia no existe'
            });
        }

        await db.query(
            `INSERT INTO incidencias
            (familia_id, tipo, descripcion, estado)
            VALUES (?, ?, ?, ?)`,
            [
                familia_id,
                tipo,
                descripcion,
                estado || 'pendiente'
            ]
        );

        res.status(201).json({
            ok: true,
            message: 'Incidencia registrada correctamente'
        });

    } catch (error) {
        console.log(error);

        res.status(500).json({
            ok: false,
            message: 'Error del servidor'
        });
    }
};

module.exports = {
    registrarIncidencia
};