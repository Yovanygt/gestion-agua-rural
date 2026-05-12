require('dotenv').config();

const app = require('./app');
const db = require('./config/db');

const PORT = process.env.PORT || 3000;

async function testConnection() {
    try {
        const [rows] = await db.query('SELECT 1 + 1 AS result');
        console.log('MySQL conectado correctamente:', rows[0].result);
    } catch (error) {
        console.log('Error MySQL:', error);
    }
}

testConnection();

app.listen(PORT, () => {
    console.log(`Servidor corriendo en puerto ${PORT}`);
});
