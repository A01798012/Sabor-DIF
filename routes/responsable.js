const express = require("express");
const router = express.Router();
const date = require("./date")

const pool = require("./db")
/**
 * @swagger
 * tags:
 *   name: Responsable 
 *   description: Endpoints relacionados con los comensales
 */

/**
 * @swagger
 * api/responsable/login:
 *   post:
 *     summary: Iniciar sesión
 *     tags: [Responsable]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nombreComedor:
 *                 type: string
 *               pswd:
 *                 type: string
 *             required:
 *               - nombreComedor
 *               - pswd
 *     responses:
 *       201:
 *         description: Inicio de sesión exitoso
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Mensaje de éxito
 *                 access:
 *                   type: array
 *                   description: Acceso a la aplicación
 *       500:
 *         description: Error interno del servidor
 */
router.post("/login", async function(req, res){
  try {
    const {idComedor, pswd} = req.body;
console.log(req.body);
    const connection = await pool.getConnection();
    const rows = await connection.query("SELECT loginResponsable(?,?)", [idComedor, pswd]);
    connection.release();
    console.log(...date(`Inicio de sesion de responsable ${rows[0][`loginResponsable(${idComedor},'${pswd}')`]} `));
    res.status(201).send({access:rows[0][`loginResponsable('${idComedor}','${pswd}')`]});
  } catch(err) {
    console.log(err);
    res.status(500);
  }
});

module.exports = router;
