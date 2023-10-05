const express = require("express");
const router = express.Router();

const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'root',
  password: 'pepe',
  database: 'comedor',
});

/**
 * @swagger
 * components:
 *   schemas:
 *     Comida:
 *       type: object
 *       required:
 *         - idComensal 
 *         - comedor
 *         - aportacion 
 *       properties:
 *         idComensal:
 *           type: string
 *           description: El id de quien pide la comida
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
 *         idComensal: 12345
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
 *               idComensal:
 *                 type: int 
 *               idComedor:
 *                 type: string
 *               aportacion:
 *                 type: float 
 *               paraLlevar:
 *                 type: int
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
    const {idComensal, idComedor, aportacion, paraLlevar } = req.body;
    const connection = await pool.getConnection();
    console.log(req.body);

    await connection.query("CALL registrarComida(?,?,?,?)", [idComensal, idComedor, aportacion, paraLlevar]);
    connection.release();
    res.status(201)
      .send({message: "OK"});
  }catch(err) {
    res.status(500).json({ message: 'Internal Server Error' });
  }
});


// Endpoint para registrar comida de un comensal dependiente
/**
 * @swagger
 * /comida/registrar/dependiente:
 *   post:
 *     summary: Registrar comida de un comensal dependiente
 *     tags: [Comida]
 *     parameters:
 *       - in: path
 *         name: idDepende 
 *         required: true
 *         schema:
 *           type: int 
 *         description: CURP del comensal principal (depende)
 *       - in: path
 *         name: idDependiente
 *         required: true
 *         schema:
 *           type: int 
 *         description: CURP del comensal dependiente
 *     responses:
 *       201:
 *         description: Comida de comensal dependiente registrada exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.post("/registrar/dependiente", async function(req, res){
  try {
    const {idComedor,idDependiente, idDepende, aportacion, paraLlevar}  = req.body;
    console.log(req.body);
    const connection = await pool.getConnection();
    await connection.query("CALL registrarComidaDependiente(?,?,?,?,?)", [idComedor,idDependiente, idDepende, aportacion, paraLlevar]);
    connection.release();
    res.status(201).send({message: "OK"});
  }catch(err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' , error: err});
  }
});
module.exports = router;
