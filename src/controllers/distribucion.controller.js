const db = require('../config/db');

const registrarDistribucion = async (req, res) => {
    try {
        const {
            sector,
            cantidad_litros,
            dia
        } = req.body;

        if (!sector || !cantidad_litros || !dia) {
            return res.status(400).json({
                ok: false,
                message: 'Sector, cantidad de litros y día son obligatorios'
            });
        }

        await db.query(
            `INSERT INTO distribucion_agua
            (sector, cantidad_litros, dia)
            VALUES (?, ?, ?)`,
            [
                sector,
                cantidad_litros,
                dia
            ]
        );

        res.status(201).json({
            ok: true,
            message: 'Distribución de agua registrada correctamente'
        });

    } catch (error) {
        console.log(error);

        res.status(500).json({
            ok: false,
            message: 'Error del servidor'
        });
    }
};

const listarDistribucion = async (req, res) => {
    try {
        const [rows] = await db.query(
            'SELECT * FROM distribucion_agua ORDER BY fecha_registro DESC'
        );

        res.json({
            ok: true,
            data: rows
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
    registrarDistribucion,
    listarDistribucion
};