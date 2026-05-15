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

        const [rows] = await db.query(
            'SELECT * FROM usuarios WHERE usuario = ?',
            [usuario]
        );

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
                id: usuarioDB.id,
                usuario: usuarioDB.usuario,
                rol: usuarioDB.rol
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
                id: usuarioDB.id,
                nombre: usuarioDB.nombre,
                usuario: usuarioDB.usuario,
                rol: usuarioDB.rol
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