const express = require('express');
const router = express.Router();

const jwt = require('jsonwebtoken');

// LOGIN
router.post('/login', async (req, res) => {

    const { usuario, password } = req.body;

    // VALIDACION SIMPLE TEMPORAL

    if (usuario !== 'admin' || password !== '123456') {

        return res.status(401).json({
            mensaje: 'Usuario o contraseña incorrectos'
        });

    }

    // TOKEN JWT

    const token = jwt.sign(

        {
            usuario: 'admin',
            rol: 1
        },

        'CLAVE_SECRETA',

        {
            expiresIn: '8h'
        }

    );

    // RESPUESTA

    res.json({

        mensaje: 'Login exitoso',

        token: token,

        usuario: 'admin',

        nombre: 'Administrador Principal',

        rol: 1

    });

});

module.exports = router;