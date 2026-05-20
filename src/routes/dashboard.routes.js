const express = require('express');

const router = express.Router();

const {
    obtenerResumen
} = require('../controllers/dashboard.controller');

router.get('/resumen', obtenerResumen);

module.exports = router;