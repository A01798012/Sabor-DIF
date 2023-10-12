const express = require("express");
const router = express.Router();
const pool = require("./db")

const date = require("./date")
router.post("/registrar", async function(req, res){
  try {
    const {IdComedor, atencion, higiene, sabor, lugar, tiempo} = req.body;
console.log(req.body);
    const connection = await pool.getConnection();
    await connection.query("CALL registrarEncuesta(?,?)", [IdComedor, atencion, higiene, sabor, lugar, tiempo]);
    connection.release();
    console.log(...date("Encuesta registrada exitosamente"))
    res.status(201).send({message: "OK"});
  } catch(err) {
    console.log(err);
    res.status(500);
  }
});
module.exports = router;