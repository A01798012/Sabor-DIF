const express = require("express")
const router = express.Router();

const pool = require("./db")

/**
 * @swagger
 * components:
 *   schemas:
 *     Comedor:
 *       type: object
 *       required:
 *         - idComedor 
 *       properties:
 *         nombre:
 *           type: string
 *           description: Nombre del comedor
 *       example:
 *         idComedor: C2LosOlivos
 */

// Endpoint para obtener nombres de comedores
/**
 * @swagger
 * api/comedor/nombres:
 *   get:
 *     summary: Obtener nombres de comedores
 *     tags: [Comedor]
 *     responses:
 *       200:
 *        description: A list of comedor names
 *        content:
 *          application/json:
 *            schema:
 *              type: object
 *              properties:
 *                message:
 *                  type: string
 *                  description: A status message indicating success.
 *                rows:
 *                  type: array
 *                  items:
 *                    type: object
 *                    properties:
 *                      NombreComedor:
 *                        type: string
 *                        description: The name of a comedor. 
 */

router.get('/nombres', async (req, res) => {
  try {
    // Call the stored procedure to obtain names from the database
    const connection = await pool.getConnection();
    const rows = await connection.query('CALL mostrarComedores()');
    connection.release();
    console.log(rows[0]);
    res.status(200).json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});
module.exports = router;
