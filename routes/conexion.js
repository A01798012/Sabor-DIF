const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'your_db_name',
});
class Conexion {
  connection;
  pool;
  constructor(){
    this.pool = mariadb.createPool({
      host: 'localhost',
      user: 'your_db_user',
      password: 'your_db_password',
      database: 'your_db_name',
    });
  }

}
