const express = require("express");
const router = express.Router();

const pool = require("./db")
/**
 * @swagger
 * tags:
 *   name: Administrador
 *   description: Endpoints relacionados con los administradores 
 */

/**
 * @swagger
 * api/administradores/login:
 *   post:
 *     summary: Iniciar sesión
 *     tags: [Administrador]
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
 *               - nombreAdmin 
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
    const {nombreAdmin, pswd} = req.body;
console.log(req.body);
    const connection = await pool.getConnection();
    const rows = await connection.query("SELECT loginAdmin(?,?)", [nombreAdmin, pswd]);
    connection.release();
    console.log(rows[0]);
    res.status(201).send({access:rows[0][`loginAdmin('${nombreAdmin}','${pswd}')`]});
  } catch(err) {
    res.status(500);
  }
});

module.exports = router;
