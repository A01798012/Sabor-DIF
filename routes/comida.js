const express = require("express");
const router = express.Router();

const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'your_db_name',
});
/**
 * @swagger
 * components:
 *   schemas:
 *     Comida:
 *       type: object
 *       required:
 *         - curpComensal 
 *         - comedor
 *         - aportacion 
 *       properties:
 *         curpComensal:
 *           type: string
 *           description: El CURP de quien pide la comida
 *         comedor:
 *           type: string
 *           description: El nombre del comedor
 *         aportacion:
 *           type: number 
 *           description: La cantidad que el comensal da en la cuota de recuperacion 
 *         curpDepende:
 *           type: string 
 *           description: CURP de quien pide la comida de quien depende de el
 *         curpDependiente:
 *           type: string
 *           description: CURP de persona que depende de curpDepende
 *       example:
 *         curpComensal: d5fE_asz
 *         comedor: The New Turing Omnibus
 *         aportacion: Alexander K. Dewdney
 *         curpDepende: false
 *         curpDependiente: 2020-03-10T04:05:06.157Z
 */

// Endpoint para registrar comida de un comensal
/**
 * @swagger
 * tags: Comida
 * /comida/registrar:
 *   post:
 *     summary: Registrar comida de un comensal
 *     tags: [Comida]
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
 *                 type: float 
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
    await connection.query("CALL registrarComida(?,?,?)", [curpComensal, comedor, aportacion]);
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
 * /comida/registrar/{depende}/{dependiente}:
 *   post:
 *     summary: Registrar comida de un comensal dependiente
 *     tags: [Comida]
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
    await connection.query("CALL registrarComidaDependiente(?,?)", [curpDepende, curpDependiente]);
    connection.release();
    res.status(201).send("Comida de dependiente registrada exitosamente");
  }catch(err) {
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
module.exports = router;
