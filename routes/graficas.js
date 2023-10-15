const express = require("express");
const router = express.Router();

const date = require("./date");
const pool = require("./db");
const { route } = require("./comedor");

/**
 * @swagger
 * components:
 *   schemas:
 *     Graficas:
 */

/**
 * @swagger
 * /api/graficas/vendidasDonadas/{idComedor}:
 *   post:
 *     summary: Para obtener las comidas vendidas y donadas de un comedor en específico
 *     tags:
 *       - Graficas
 *     parameters:
 *       - in: path
 *         name: idComedor
 *         required: true
 *         description: ID del comedor del que se desean obtener las comidas vendidas y donadas.
 *         schema:
 *           type: integer
 *     responses:
 *       201:
 *         description: Éxito. Se han obtenido las comidas vendidas y donadas correctamente.
 *       500:
 *         description: Error interno del servidor.
 */
router.post("/vendidasDonadas/:idComedor", async function (req, res) {
  try {
    const idComedor = req.params.idComedor;
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL mostrarDonadasVendidas(?)", [idComedor]);
    const serializedRows = rows[0].map(row => {
      return {
        ...row,
        TotalComidasVendidas: Number(row.TotalComidasVendidas),
        TotalComidasDonadas: Number(row.TotalComidasDonadas),
      }
    });
    connection.release();
    console.log(...date(`Donadas y Vendidas de ${idComedor}`));
    res.status(201).send(serializedRows);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});
/**
 * @swagger
 * /api/graficas/comidasDiarias:
 *   post:
 *     summary: Para obtener las comidas diarias
 *     tags:
 *       - Graficas
 *     parameters:
 *       - in: body
 *         name: ComidaDiariaRequest
 *         description: Objeto de solicitud para obtener las comidas diarias.
 *         required: true
 *         schema:
 *           type: object
 *           properties:
 *             idComedor:
 *               type: integer
 *               description: ID del comedor del que se desean obtener las comidas diarias.
 *             fecha:
 *               type: string
 *               format: date
 *               description: Fecha de la que se desean obtener las comidas diarias.
 *     responses:
 *       201:
 *         description: Éxito. Se han obtenido las comidas diarias correctamente.
 *       500:
 *         description: Error interno del servidor.
 */
router.post("/comidasDiarias", async function (req, res) {
  try {
    const {idComedor, fecha} = req.body
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL graficaComidasDiarias(?,?)", [idComedor, fecha]);
    const serializedRows = rows[0].map(row => {
      return {
        ...row,
        TotalComidasVendidas: Number(row.TotalComidasVendidas),
        TotalComidasDonadas: Number(row.TotalComidasDonadas),
      };
    });
    connection.release();
    console.log(...date(`Comidas de ${idComedor} en ${fecha}`));
    res.status(201).send(serializedRows);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});


/**
 * @swagger
 * /api/graficas/condiciones:
 *   post:
 *     summary: Para obtener cuántas personas tienen cierto número de condiciones
 *     tags:
 *       - Graficas
 *     responses:
 *       201:
 *         description: Éxito. Se ha obtenido la cantidad de personas con condiciones correctamente.
 *       500:
 *         description: Error interno del servidor.
 */
router.post("/condiciones", async function (req, res) {
  try {
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL graficaCantidadCondicion()", []);
    const serializedRows = rows[0].map(row => {
      // Convert bigint columns to regular integers
      return {
        ...row,
        TotalComensales: Number(row.TotalComensales),
      };
    });
    connection.release();
    console.log(...date(`Registro de condiciones enviado`));
    res.status(201).send(serializedRows);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});


/**
 * @swagger
 * /api/graficas/comidasDiarias/llevar:
 *   get:
 *     summary: Para obtener cuántas comidas son para llevar al día
 *     tags:
 *       - Graficas
 *     parameters:
 *       - in: body
 *         name: ComidasLlevarRequest
 *         description: Objeto de solicitud para obtener las comidas para llevar diarias.
 *         required: true
 *         schema:
 *           type: object
 *           properties:
 *             idComedor:
 *               type: integer
 *               description: ID del comedor del que se desean obtener las comidas para llevar diarias.
 *             fecha:
 *               type: string
 *               format: date
 *               description: Fecha de la que se desean obtener las comidas para llevar diarias.
 *     responses:
 *       201:
 *         description: Éxito. Se han obtenido las comidas para llevar diarias correctamente.
 *       500:
 *         description: Error interno del servidor.
 */

router.post("/comidasDiarias/llevar", async function (req, res) {
  try {
    const {idComedor, fecha} = req.body
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL graficaComidasParaLlevarDiarias(?,?)", [idComedor, fecha]);
    connection.release();
    console.log(...date(`Comidas para llevar diarias en ${idComedor} - ${fecha}`));
    res.status(201).send(rows[0]);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});
/**
 * @swagger
 * /api/graficas/comidas/mensuales:
 *   post:
 *     summary: Obtener estadísticas de comidas mensuales
 *     tags:
 *       - Graficas
 *     parameters:
 *       - in: query
 *         name: idComedor
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID del comedor para el que se desean obtener estadísticas mensuales.
 *       - in: query
 *         name: fecha
 *         required: true
 *         schema:
 *           type: string
 *           format: date
 *         description: Fecha para la cual se desean obtener estadísticas mensuales.
 *     responses:
 *       201:
 *         description: Éxito. Estadísticas mensuales obtenidas correctamente.
 *       500:
 *         description: Error interno del servidor.
 */
router.post("/comidas/mensuales", async function (req, res) {
  try {
    const {idComedor, fecha} = req.body
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL graficaComidasMensuales(?,?)", [idComedor, fecha]);
    const serializedRows = rows[0].map(row => {
      return {
        ...row,
        TotalComidasVendidas: Number(TotalComidasVendidas),
        TotalComidasDonadas: TotalComidasDonadas
      };
    });
    connection.release();
    console.log(...date(`Comidas para mensuales en ${idComedor} - ${fecha}`));
    res.status(201).send(serializedRows);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});

/**
 * @swagger
 * /api/graficas/comidasMensuales/llevar:
 *   post:
 *     summary: Obtener estadísticas de comidas para llevar mensuales
 *     tags:
 *       - Graficas
 *     parameters:
 *       - in: query
 *         name: idComedor
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID del comedor para el que se desean obtener estadísticas de comidas para llevar mensuales.
 *       - in: query
 *         name: fecha
 *         required: true
 *         schema:
 *           type: string
 *           format: date
 *         description: Fecha para la cual se desean obtener estadísticas de comidas para llevar mensuales.
 *     responses:
 *       201:
 *         description: Éxito. Estadísticas de comidas para llevar mensuales obtenidas correctamente.
 *       500:
 *         description: Error interno del servidor.
 */

router.post("/comidasMensuales/llevar", async function (req, res) {
  try {
    const {idComedor, fecha} = req.body
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL graficaComidasParaLlevarMensuales(?,?)", [idComedor, fecha]);
    connection.release();
    console.log(...date(`Comidas para llevar mensuales en ${idComedor} - ${fecha}`));
    res.status(201).send(rows[0]);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});

/**
 * @swagger
 * /api/graficas/encuesta:
 *   post:
 *     summary: Obtener estadísticas de encuestas de comedor
 *     tags:
 *       - Graficas
 *     parameters:
 *       - in: query
 *         name: idComedor
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID del comedor del que se desean obtener estadísticas de encuestas.
 *     responses:
 *       201:
 *         description: Éxito. Estadísticas de encuestas obtenidas correctamente.
 *       500:
 *         description: Error interno del servidor.
 */

router.post("/encuesta", async function (req, res) {
  try {
    const idComedor  = req.body.idComedor
    const connection = await pool.getConnection();
    const rows = await connection.query("CALL graficaEncuesta(?)", [idComedor]);
    const serializedRows = rows[0].map(row => {
      return {
        ...row,
        NumeroEncuestas: Number(row.NumeroEncuestas),
      }
    })
//    console.log(serializedRows);
    connection.release();
    console.log(...date(`Encuesta del comedor ${idComedor} enviadas`));
    res.status(201).send(serializedRows);
  } catch (err) {
    console.log(err);
    res.status(500).send({ message: 'Error interno del servidor' });
  }
});
module.exports = router;
