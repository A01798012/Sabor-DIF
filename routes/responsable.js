const express = require("express");
const router = express.Router();

const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'root',
  password: 'pepe',
  database: 'comedor',
});
//TODO login
router.post("/login", async function(req, res){
  try {
    const {nombreComedor, pswd} = req.body;
console.log(req.body);
    const connection = await pool.getConnection();
    const rows = await connection.query("SELECT loginResponsable(?,?)", [nombreComedor, pswd]);
    connection.release();
    console.log(rows[0]);
    res.status(201).send({message: "OK", access: rows[0]});
  } catch(err) {
    res.status(500);
  }
});

module.exports = router;
