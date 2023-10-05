const express = require("express")
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
 * /comensal/dependientes/{idResponsable}:
 *   get:
 *     summary: Obtener dependientes de un comensal
 *     tags: [Comensal]
 *     parameters:
 *       - in: path
 *         name: idResponsable 
 *         required: true
 *         schema:
 *           type: int
 *         description: id del responsable del que queremos mostrar sus dependientes
 *     responses:
 *       201:
 *         description: Dependientes obtenidos exitosamente
 *       500:
 *         description: Error interno del servidor
 */

router.get("/dependientes/:idResponsable", async function(req, res){
  try {
    const idResponsable = (req.params.idResponsable);
    console.log(idResponsable);
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL mostrarDependientes(?)", [idResponsable]);
    connection.release();
    console.log(rows[0]);
    res.status(200).send({message:"OK", rows: rows[0]});
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
    const rows = await connection.query("CALL mostrarComensales()", []);
    connection.release();
    console.log(rows[0]);
    res.status(200).send({message:"OK", rows: rows[0]});
  }catch(err) {
    res.status(err);
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
 *               idDepende:
 *                 type: string
 *               idDependiente:
 *                 type: string
 *             required:
 *               - idDepende 
 *               - idDependiente 
 *     responses:
 *       201:
 *         description: Dependiente registrado exitosamente
 *       500:
 *         description: Error interno del servidor
 */

/// ????
router.post("/registrar/dependiente", async function(req, res){
  try {
    const idDepende = req.body.idDepende;
    const idDependiente = req.body.idDependiente;
    console.log(req.body);
    const connection = await pool.getConnection();
    await connection.query("CALL registrarDependencia(?,?)", [idDependiente, idDepende]);
    connection.release();
    res.status(201).send({message: "OK"});
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
    console.log(req.body);

    const {nombreComensal, 
      apellidoPaterno,
      apellidoMaterno, 
      curp,
      genero} = req.body;
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL registrarComensal(?, ?, ?, ?, ?)",
    [nombreComensal, apellidoPaterno, apellidoMaterno, curp, genero]);
    connection.release();
    console.log(res);
    res.status(201).send({message: "OK", idComensal: rows[0][0]});
  }catch(err){
    console.log(err);
    res.status(500).json({message: 'Internal Server Error'});
  }
});

module.exports = router;
