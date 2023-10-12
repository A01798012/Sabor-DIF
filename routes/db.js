const mariadb = require("mariadb");
// db.js

const pool = mariadb.createPool({
  host: 'localhost',
  user: process.env.db_name,
  password: process.env.db_pswd,
  database: 'comedor',
});
// Set your database connection details

module.exports = pool;
