const express = require("express")
const router = express.Router();

const mariadb = require("mariadb");
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'your_db_name',
});
// Endpoint para insertar/registrar un comensal
/**
 * @swagger
 * /comensal/registrar:
 *   post:
 *     summary: Registrar un nuevo comensal
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nombreComensal:
 *                 type: string
 *               apellidoPaterno:
 *                 type: string
 *               apellidoMaterno:
 *                 type: string
 *               curp:
 *                 type: string
 *               genero:
 *                 type: string
 *             required:
 *               - nombreComensal
 *               - apellidoPaterno
 *               - apellidoMaterno
 *               - curp
 *               - genero
 *     responses:
 *       201:
 *         description: Comensal registrado exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.post("/registrar", async function(req, res){
  try {
    const {nombreComensal, 
      apellidoPaterno,
      apellidoMaterno, 
      curp,
      genero} = req.body;
    const connection = await pool.getConnection();
    await connection.query("CALL InsertarComensal(?, ?, ?, ?, ?)",
    [nombreComensal, apellidoPaterno, apellidoMaterno, curp, genero]);
    connection.release();
    res.status(201).send(`${curp} registrado`);
  }catch(err){
    console.log(err);
    res.status(500).json({message: 'Internal Server Error'});
  }
});

// Endpoint para obtener dependencias de un comensal
/**
 * @swagger
 * /comensal/{curp}/dependientes:
 *   get:
 *     summary: Obtener dependientes de un comensal
 *     parameters:
 *       - in: path
 *         name: curp
 *         required: true
 *         schema:
 *           type: string
 *         description: CURP del comensal
 *     responses:
 *       201:
 *         description: Dependientes obtenidos exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.get("/:curp/dependientes", async function(req, res){
  try {
    const curp = req.params.curp;
    const connection = await pool.getConnection();
    const rows = await connection.query("ObtenerDependientes(?)", [curp]);
    connection.release();
    console.log(rows);
    res.status(201).send(`Enviando dependencias de ${curp}`);
  }catch(err) {
    res.status(500);

  }
});

// Endpoint para obtener todos los comensales registrados
/**
 * @swagger
 * /comensal/todos:
 *   get:
 *     summary: Obtener todos los comensales registrados
 *     responses:
 *       201:
 *         description: Comensales obtenidos exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.get("/todos", async function(req, res){
  try {
    const connection = await pool.getConnection();
    const rows = await connection.query("ObtenerComensales()", []);
    connection.release();
    console.log(rows);
    res.status(201).send(`Enviando comensales`);
  }catch(err) {
    res.status(500);
  }
});

//TODO 
//TODO 


//




module.exports = router;
