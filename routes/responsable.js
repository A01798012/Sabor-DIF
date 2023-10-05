const express = require("express");
const router = express.Router();

const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'your_db_name',
});
//TODO login
router.post("/login", async function(req, res){
  try {
    const {nombreComedor, pswd} = req.body
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL loginResponsable(?,?)", [nombreComedor, pswd]);
    connection.release();
    console.log(rows[0]);
    res.status(201).send({message: "OK", access: rows[0]});
  } catch(err) {
    res.status(500);
  }
});

module.exports = router;
