const express = require('express');
const router = express.Router();

const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const pool = require('../config/db');

// LOGIN

router.post('/login', async (req, res) => {

    const { usuario, password } = req.body;

    try {

        // BUSCAR USUARIO EN POSTGRESQL

        const resultado = await pool.query(

            'SELECT * FROM usuarios WHERE usuario = $1',

            [usuario]

        );

        // VALIDAR SI EXISTE

        if (resultado.rows.length === 0) {

            return res.status(401).json({

                mensaje: 'Usuario no encontrado'

            });

        }

        // USUARIO ENCONTRADO

        const usuarioDB = resultado.rows[0];

        // VALIDAR PASSWORD CON BCRYPT

        const passwordCorrecta = await bcrypt.compare(

            password,

            usuarioDB.password

        );

        if (!passwordCorrecta) {

            return res.status(401).json({

                mensaje: 'Contraseña incorrecta'

            });

        }

        // GENERAR JWT

        const token = jwt.sign(

            {

                id_usuario: usuarioDB.id_usuario,
                usuario: usuarioDB.usuario,
                rol: usuarioDB.id_rol

            },

            'CLAVE_SECRETA',

            {

                expiresIn: '8h'

            }

        );

        // RESPUESTA

        res.json({

            mensaje: 'Login exitoso',

            token,

            usuario: usuarioDB.usuario,

            nombre: usuarioDB.nombre_completo,

            rol: usuarioDB.id_rol

        });

    } catch (error) {

        console.log(error);

        res.status(500).json({

            mensaje: 'Error en servidor'

        });

    }

});

module.exports = router;