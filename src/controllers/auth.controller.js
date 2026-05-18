const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const db = require('../config/db');

const login = async (req, res) => {
    try {
        const { usuario, password } = req.body;

        if (!usuario || !password) {
            return res.status(400).json({
                ok: false,
                message: 'Usuario y contraseña son obligatorios'
            });
        }

        const result = await db.query(
            'SELECT * FROM usuarios WHERE usuario = $1',
            [usuario]
        );

        const rows = result.rows;

        if (rows.length === 0) {
            return res.status(404).json({
                ok: false,
                message: 'Usuario no encontrado'
            });
        }

        const usuarioDB = rows[0];

        const passwordCorrecta = await bcrypt.compare(
            password,
            usuarioDB.password
        );

        if (!passwordCorrecta) {
            return res.status(401).json({
                ok: false,
                message: 'Contraseña incorrecta'
            });
        }

        const token = jwt.sign(
            {
                id: usuarioDB.id_usuario,
                usuario: usuarioDB.usuario,
                rol: usuarioDB.id_rol
            },
            process.env.JWT_SECRET,
            {
                expiresIn: '8h'
            }
        );

        res.json({
            ok: true,
            message: 'Bienvenido al sistema',
            token,
            usuario: {
                id: usuarioDB.id_usuario,
                nombre: usuarioDB.nombre_completo,
                usuario: usuarioDB.usuario,
                rol: usuarioDB.id_rol
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

module.exports = {
    login
};