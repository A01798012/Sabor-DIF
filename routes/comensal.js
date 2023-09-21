const express = require("express")
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
 *     Comensal:
 *       type: object
 *       required:
 *         - nombres 
 *         - apellidoPaterno
 *         - apellidoMaterno
 *         - curp
 *         - genero
 *       properties:
 *         nombres:
 *           type: string
 *           description: Nombres del comensal
 *         apellidoPaterno:
 *           type: string
 *           description: Apellido paterno del comensal
 *         apellidoMaterno:
 *           type: string
 *           description: Apellido materno del comensal 
 *         curp:
 *           type: string 
 *           description: El CURP del comensal
 *         genero:
 *           type: string
 *           description: Genero del comensal
 *       example:
 *         nombres: Juan Carlos
 *         apellidoPaterno: Perez
 *         apellidoMaterno: Garcia
 *         curp: PEGJ850315HJCRRN07
 *         genero: H
 */
// Endpoint para obtener dependencias de un comensal
/**
 * @swagger
 * /comensal/{curp}/dependientes:
 *   get:
 *     summary: Obtener dependientes de un comensal
 *     tags: [Comensal]
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
    res.status(200).send(`Enviando dependencias de ${curp}`);
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
 *     tags: [Comensal]
 *     responses:
 *       201:
 *         description: Comensales obtenidos exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.get("/todos", async function(req, res){
  try {
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL ObtenerComensales()", []);
    connection.release();
    console.log(rows);
    res.status(200).send(`Enviando comensales`);
  }catch(err) {
    res.status(500);
  }
});
// Endpoint para insertar/registrar un dependiente  
/**
 * @swagger
 * /comensal/registrar/dependiente:
 *   post:
 *     summary: Registrar un nuevo dependiente 
 *     tags: [Comensal]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               curpDepende:
 *                 type: string
 *               curpDependiente:
 *                 type: string
 *             required:
 *               - curpDepende
 *               - curpDependiente
 *     responses:
 *       201:
 *         description: Dependiente registrado exitosamente
 *       500:
 *         description: Error interno del servidor
 */


router.post("/registrar/dependiente", async function(req, res){
  try {
    const {curpeDepende, curpDependiente} = req.body;
    const connection = await pool.getConnection();
    await connection.query("CALL RegistrarDependiente(?,?)", [curpeDepende, curpDependiente]);
    connection.release();
    res.status(201).send(`${curpDependiente} depende de ${curpeDepende}`);
  } catch(err) {
    res.status(500);
  }
});
// Endpoint para insertar/registrar un comensal
/**
 * @swagger
 * /comensal/registrar:
 *   post:
 *     summary: Registrar un nuevo comensal
 *     tags: [Comensal]
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


//TODO 
//TODO 


//




module.exports = router;
