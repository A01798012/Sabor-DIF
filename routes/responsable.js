const express = require("express");
const router = express.Router();

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
