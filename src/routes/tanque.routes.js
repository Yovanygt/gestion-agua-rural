const express = require('express');

const router = express.Router();

const {
    registrarNivelTanque,
    obtenerNivelesTanque
} = require('../controllers/tanque.controller');

router.post('/registrar', registrarNivelTanque);
router.get('/listar', obtenerNivelesTanque);

module.exports = router;
