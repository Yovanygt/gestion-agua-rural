const express = require('express');

const router = express.Router();

const {
    registrarIncidencia
} = require('../controllers/incidencia.controller');

router.post('/registrar', registrarIncidencia);

module.exports = router;