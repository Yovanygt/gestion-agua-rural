const { Pool } = require('pg');

const pool = new Pool({

    user: 'postgres',
    host: 'localhost',
    database: 'gestion_agua_rural',
    password: 'Temporal01',
    port: 5432

});

module.exports = pool;