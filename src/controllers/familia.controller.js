const db = require('../config/db');

const registrarFamilia = async (req, res) => {

    try {

        const {
            nombre_jefe,
            dpi,
            telefono,
            direccion,
            sector
        } = req.body;

        // Validación
        if (!nombre_jefe || !dpi) {

            return res.status(400).json({
                ok: false,
                message: 'Nombre y DPI son obligatorios'
            });

        }

        // Verificar si ya existe
        const [existe] = await db.query(
            'SELECT * FROM familias WHERE dpi = ?',
            [dpi]
        );

        if (existe.length > 0) {

            return res.status(400).json({
                ok: false,
                message: 'La familia ya está registrada'
            });

        }

        // Insertar familia
        await db.query(
            `INSERT INTO familias
            (nombre_jefe, dpi, telefono, direccion, sector)
            VALUES (?, ?, ?, ?, ?)`,
            [
                nombre_jefe,
                dpi,
                telefono,
                direccion,
                sector
            ]
        );

        res.status(201).json({
            ok: true,
            message: 'Familia registrada correctamente'
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
    registrarFamilia
};