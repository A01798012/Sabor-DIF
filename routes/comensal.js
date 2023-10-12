const express = require("express")
const router = express.Router();

const date = require("./date")
const pool = require("./db")
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
/**
 * @swagger
 * api/comensal/dependientes/{idResponsable}:
 *   get:
 *     summary: Obtener dependientes de un responsable
 *     tags: [Comensal]
 *     parameters:
 *       - in: path
 *         name: idResponsable
 *         required: true
 *         description: ID del responsable
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Dependientes obtenidos exitosamente
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de éxito
 *                 rows:
 *                   type: array
 *                   description: Lista de dependientes
 *       500:
 *         description: Error interno del servidor
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de error
 */
router.get("/dependientes/:idResponsable", async function(req, res){
  try {
    const idResponsable = req.params.idResponsable;
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL mostrarDependientes(?)", [idResponsable]);
    connection.release();
    console.log(...date("Dependientes obtenidos"))
    res.status(200).send(rows[0]);
  } catch(err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});

/**
 * @swagger
 * api/comensal/todos:
 *   get:
 *     summary: Obtener todos los comensales registrados
 *     tags: [Comensal]
 *     responses:
 *       200:
 *         description: Comensales obtenidos exitosamente
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de éxito
 *                 rows:
 *                   type: array
 *                   description: Lista de comensales
 *       500:
 *         description: Error interno del servidor
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de error
 */
router.get("/todos", async function(req, res){
  try {
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL mostrarComensales()", []);
    connection.release();
    console.log(...date("Datos de comensales enviados"))
    res.status(200).send(rows[0]);
  } catch(err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});

/**
 * @swagger
 * api/comensal/registrar/dependiente:
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
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de éxito
 *       500:
 *         description: Error interno del servidor
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de error
 */
router.post("/registrar/dependiente", async function(req, res){
  try {
    const idDepende = req.body.idDepende;
    const idDependiente = req.body.idDependiente;
    const connection = await pool.getConnection();
    await connection.query("CALL registrarDependencia(?,?)", [idDependiente, idDepende]);
    console.log(...date("Registro de dependencia"))
    connection.release();
    res.status(201).send({ message: "Dependiente registrado exitosamente" });
  } catch(err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});

/**
 * @swagger
 * api/comensal/registrar:
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
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 */ 

router.post("/registrar", async function(req, res){
  try {
    const { nombreComensal, apellidoPaterno, apellidoMaterno, curp, genero } = req.body;
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL registrarComensal(?, ?, ?, ?, ?)",
    [nombreComensal, apellidoPaterno, apellidoMaterno, curp, genero]);
    connection.release();
    console.log("Registro de comensal exitoso")
    res.status(201).send(rows[0][0]);
  } catch(err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});

module.exports = router;
