const express = require('express');

const router = express.Router();

const {
    registrarFamilia
} = require('../controllers/familia.controller');

router.post('/registrar', registrarFamilia);

module.exports = router;