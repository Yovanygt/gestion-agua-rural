require('dotenv').config();

const app = require('./app');

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log('=================================');
    console.log(`Servidor corriendo en puerto ${PORT}`);
    console.log(`Login: http://localhost:${PORT}/login.html`);
    console.log(`API: http://localhost:${PORT}/api`);
    console.log('=================================');
});
