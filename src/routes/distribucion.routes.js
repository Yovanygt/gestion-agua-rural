const express = require('express');

const router = express.Router();

const {
    registrarDistribucion,
    listarDistribucion
} = require('../controllers/distribucion.controller');

router.post('/registrar', registrarDistribucion);
router.get('/listar', listarDistribucion);

module.exports = router;