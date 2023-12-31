const express = require("express")
const router = express.Router();
const date = require("./date")

const pool = require("./db")

/**
 * @swagger
 * components:
 *   schemas:
 *     Apertura:
 *       type: object
 *       required:
 *         - nombreComedor
 *         - abierto
 *       properties:
 *         nombreComedor:
 *           type: string
 *           description: Nombre del comedor
 *         abierto:
 *           type: int
 *           description: 1 si esta abierto 0 si no
 *       example:
 *         nombreComedor: "CP12921"
 *         abierto: 1
 */

/**
 * @swagger
 * tags:
 *   name: Apertura 
 * api/apertura/registrar:
 *   post:
 *     summary: Registrar apertura de un comedor
 *     tags: [Apertura]
 *     responses:
 *       200:
 *         description: Nombres de comedores obtenidos exitosamente
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 nombreComedor:
 *                   type: string 
 *                   description: Lista de nombres de comedores
 *                 abierto:
 *                   type: integer
 *                   description: 1 si abre, 0 si no
 *       500:
 *         description: Error interno del servidor
 */
router.post('/registrar', async (req, res) => {
  try {
    // Call the stored procedure to obtain names from the database
    const {idComedor, abierto} = req.body
    const connection = await pool.getConnection();
    await connection.query('CALL notificarApertura(?,?)', [idComedor, abierto]);
    connection.release();
    console.log(...date(`Apertura notificada`))
    res.status(200).json({message: "OK"});
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
module.exports = router;
