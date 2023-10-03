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
 *     Comedor:
 *       type: object
 *       required:
 *         - nombre 
 *       properties:
 *         nombre:
 *           type: string
 *           description: nombre del comedor
 *       example:
 *         nombre: idk
 */

// Endpoint para obtener nombres de comedores
/**
 * @swagger
 * tags:
 *   name: Comedor 
 * /comedor/nombres:
 *   get:
 *     summary: Obtener nombres de comedores
 *     tags: [Comedor]
 *     responses:
 *       200:
 *         description: Nombres de comedores obtenidos exitosamente
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 nombres:
 *                   type: array
 *                   items:
 *                     type: string
 *                   description: Lista de nombres de comedores
 *       500:
 *         description: Error interno del servidor
 */

router.get('/nombres', async (req, res) => {
  try {
    // Call the stored procedure to obtain names from the database
    const connection = await pool.getConnection();
    const rows = await connection.query('CALL mostrarComedores()');
    connection.release();
    console.log(rows[0]);
    const nombres = rows.map((row) => row.nombre);
    res.status(200).json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
module.exports = router;
