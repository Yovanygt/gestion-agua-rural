require('dotenv').config();

const app = require('./app');
const connection = require('./config/db');

const PORT = process.env.PORT || 3000;

connection.connect((error) => {
    if (error) {
        console.log('Error MySQL:', error);
        return;
    }

    console.log('MySQL conectado');
});

app.listen(PORT, () => {
    console.log(`Servidor corriendo en puerto ${PORT}`);
});