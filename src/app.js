const express = require('express');
const cors = require('cors');

const authRoutes = require('./routes/auth.routes');
const familiaRoutes = require('./routes/familia.routes');
const incidenciaRoutes = require('./routes/incidencia.routes');
const tanqueRoutes = require('./routes/tanque.routes');
const distribucionRoutes = require('./routes/distribucion.routes');

const app = express();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.json({
        message: 'API Control Agua funcionando'
    });
});

app.use('/api/auth', authRoutes);
app.use('/api/familias', familiaRoutes);
app.use('/api/incidencias', incidenciaRoutes);
app.use('/api/tanques', tanqueRoutes);
app.use('/api/distribucion', distribucionRoutes);

module.exports = app;
