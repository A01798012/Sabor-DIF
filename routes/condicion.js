const express = require("express")
const router = express.Router();

const pool = require("./db")
/**
 * @swagger
 * components:
 *   schemas:
 *     Condicion:
 *       type: object
 *       required:
 *         - idComensal 
 *         - idCondicion 
 *       properties:
 *         idComensal:
 *           type: int
 *           description: idComensal 
 *         idCondicion:
 *           type: int
 *           description: idCondicion
 *       example:
 *         nombreComedor: "CP12921"
 *         abierto: 1
 */

/**
 * @swagger
 * tags:
 *   name: Condicion 
 * /condicion/todas:
 *   get:
 *     summary: Mostrar condiciones registradas en el sistema
 *     tags: [Condicion]
 *     responses:
 *       200:
 *         description: Nombres de condiciones obtenidos exitosamente
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 rows:
 *                   type: array 
 *                   description: Lista de nombres de condiciones 
 *       500:
 *         description: Error interno del servidor
 */
router.get('/todas', async (req, res) => {
  try {
    // Call the stored procedure to obtain names from the database
    const connection = await pool.getConnection();
    const rows = await connection.query('CALL mostrarCondicion()', []);
    connection.release();
    res.status(200).json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
/**
 * @swagger
 * /registrar:
 *   post:
 *     summary: Registrar un nuevo dependiente 
 *     tags: [Condicion]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               idComensal:
 *                 type: int 
 *               idCondicion:
 *                 type: int
 *             required:
 *               - idComensal
 *               - idCondicion
 *     responses:
 *       201:
 *         description: {message: "OK"}
 *       500:
 *         description: Error interno del servidor
 */

router.get('/todas', async (req, res) => {
  try {
    // Call the stored procedure to obtain names from the database
    const connection = await pool.getConnection();
    const rows = await connection.query('CALL mostrarCondicion()', []);
    connection.release();
    res.status(200).json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
router.post("/registrar", async (req, res) => {
  try{
    const {idComensal, idCondicion} = req.body
    const connection = await pool.getConnection();
    await connection.query("CALL registrarCondiciones(?,?)", [idComensal, idCondicion]);
    connection.release();
    res.status(200).json({message: "OK"});
  }catch(err) {
    console.error(err)
    res.status(500).json({ message: 'Internal Server Error' });
  }

});
module.exports = router;
