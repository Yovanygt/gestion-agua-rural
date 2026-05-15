require('dotenv').config();

const app = require('./app');
const db = require('./config/db');

const PORT = process.env.PORT || 3000;

async function iniciarServidor() {
    try {

        const connection = await db.getConnection();

        console.log('MySQL conectado correctamente');

        connection.release();

        app.listen(PORT, () => {
            console.log(`Servidor corriendo en puerto ${PORT}`);
        });

    } catch (error) {

        console.log('Error MySQL');
        console.log(error);

    }
}

iniciarServidor();