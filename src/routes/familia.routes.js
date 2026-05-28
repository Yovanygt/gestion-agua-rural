const express = require('express');
const router = express.Router();
const pool = require('../config/db');

// OBTENER TODAS LAS FAMILIAS
router.get('/', async (req, res) => {
    try {
        const [familias] = await pool.query(`
            SELECT 
                id,
                nombre_jefe,
                dpi,
                telefono,
                correo,
                direccion,
                sector,
                estado,
                fecha_registro
            FROM familias
            ORDER BY id DESC
        `);

        res.json(familias);

    } catch (error) {
        console.error('Error al obtener familias:', error);

        res.status(500).json({
            mensaje: 'Error al obtener familias'
        });
    }
});

// REGISTRAR NUEVA FAMILIA
router.post('/', async (req, res) => {
    try {
        const {
            nombre_jefe,
            dpi,
            telefono,
            correo,
            direccion,
            sector,
            estado,
            fecha_registro
        } = req.body;

        if (!nombre_jefe || !dpi) {
            return res.status(400).json({
                mensaje: 'El nombre del jefe de familia y el DPI son obligatorios'
            });
        }

        const [dpiExiste] = await pool.query(
            'SELECT id FROM familias WHERE dpi = ?',
            [dpi]
        );

        if (dpiExiste.length > 0) {
            return res.status(400).json({
                mensaje: 'Ya existe una familia registrada con ese DPI'
            });
        }

        const [resultado] = await pool.query(
            `INSERT INTO familias
            (
                nombre_jefe,
                dpi,
                telefono,
                correo,
                direccion,
                sector,
                estado,
                fecha_registro
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                nombre_jefe,
                dpi,
                telefono || null,
                correo || null,
                direccion || null,
                sector || null,
                estado || 'Activa',
                fecha_registro || new Date()
            ]
        );

        const [familiaGuardada] = await pool.query(
            `SELECT 
                id,
                nombre_jefe,
                dpi,
                telefono,
                correo,
                direccion,
                sector,
                estado,
                fecha_registro
            FROM familias
            WHERE id = ?`,
            [resultado.insertId]
        );

        res.status(201).json({
            mensaje: 'Familia registrada correctamente',
            familia: familiaGuardada[0]
        });

    } catch (error) {
        console.error('Error al registrar familia:', error);

        res.status(500).json({
            mensaje: 'Error al registrar familia'
        });
    }
});

module.exports = router;
