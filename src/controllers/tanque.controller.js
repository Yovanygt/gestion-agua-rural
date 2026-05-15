const db = require('../config/db');

const registrarNivelTanque = async (req, res) => {
    try {
        const {
            nombre_tanque,
            nivel_actual,
            capacidad_total
        } = req.body;

        if (!nombre_tanque || !nivel_actual || !capacidad_total) {
            return res.status(400).json({
                ok: false,
                message: 'Nombre del tanque, nivel actual y capacidad total son obligatorios'
            });
        }

        const porcentaje = (nivel_actual / capacidad_total) * 100;

        let estado = 'normal';

        if (porcentaje < 30) {
            estado = 'bajo';
        } else if (porcentaje > 90) {
            estado = 'alto';
        }

        await db.query(
            `INSERT INTO niveles_tanque
            (nombre_tanque, nivel_actual, capacidad_total, porcentaje, estado)
            VALUES (?, ?, ?, ?, ?)`,
            [
                nombre_tanque,
                nivel_actual,
                capacidad_total,
                porcentaje,
                estado
            ]
        );

        res.status(201).json({
            ok: true,
            message: 'Nivel del tanque registrado correctamente',
            data: {
                nombre_tanque,
                nivel_actual,
                capacidad_total,
                porcentaje: porcentaje.toFixed(2),
                estado
            }
        });

    } catch (error) {
        console.log(error);

        res.status(500).json({
            ok: false,
            message: 'Error del servidor'
        });
    }
};

const obtenerNivelesTanque = async (req, res) => {
    try {
        const [rows] = await db.query(
            'SELECT * FROM niveles_tanque ORDER BY fecha_registro DESC'
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
    registrarNivelTanque,
    obtenerNivelesTanque
};