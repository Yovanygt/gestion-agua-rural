const app = require('./app');
const db = require('./config/db.js');

const PORT = process.env.PORT || 3000;

const iniciarServidor = async () => {
    try {

        await db.connect();

        console.log('PostgreSQL conectado');

        app.listen(PORT, () => {
            console.log(`Servidor corriendo en puerto ${PORT}`);
        });

    } catch (error) {

        console.log('Error PostgreSQL');
        console.log(error);

    }
};

iniciarServidor();