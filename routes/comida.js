const express = require("express");
const router = express.Router();

const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'your_db_name',
});
//TODO registrar comida para uno mismo

// Endpoint para registrar comida de un comensal
/**
 * @swagger
 * /comida/registrar:
 *   post:
 *     summary: Registrar comida de un comensal
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               curpComensal:
 *                 type: string
 *               comedor:
 *                 type: string
 *               aportacion:
 *                 type: number
 *             required:
 *               - curpComensal
 *               - comedor
 *               - aportacion
 *     responses:
 *       201:
 *         description: Comida registrada exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.post("/registrar", async function(req, res){
  try {
    const {curpComensal, comedor, aportacion} = req.body;
    const connection = await pool.getConnection();
    await connection.query("CALL RegistrarComida(?,?,?)", [curpComensal, comedor, aportacion]);
    connection.release();
    res.status(201)
      .send(`${curpComensal} comió e hizo un aporte de ${aportacion}`);
  }catch(err) {
    res.status(500).json({ message: 'Internal Server Error' });
  }
});


// Endpoint para registrar comida de un comensal dependiente
/**
 * @swagger
 * /registrar/{depende}/{dependiente}:
 *   post:
 *     summary: Registrar comida de un comensal dependiente
 *     parameters:
 *       - in: path
 *         name: depende
 *         required: true
 *         schema:
 *           type: string
 *         description: CURP del comensal principal (depende)
 *       - in: path
 *         name: dependiente
 *         required: true
 *         schema:
 *           type: string
 *         description: CURP del comensal dependiente
 *     responses:
 *       201:
 *         description: Comida de comensal dependiente registrada exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.post("/registrar/:depende/:dependiente", async function(req, res){
  try {
    const curpDepende = req.params.depende;
    const curpDependiente = req.params.dependiente;
    const connection = await pool.getConnection();
    await connection.query("CALL RegistrarComidaDependiente(?,?)", [curpDepende, curpDependiente]);
    connection.release();
    res.status(201).send("Comida de dependiente registrada exitosamente");
  }catch(err) {
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
module.exports = router;
