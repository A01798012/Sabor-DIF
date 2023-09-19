const express = require("express"),
  bodyParser = require("body-parser"),
  swaggerJsdoc = require("swagger-jsdoc"),
  swaggerUi = require("swagger-ui-express")
const app = express();

const options = {
  definition: {
    openapi: "3.1.0",
    info: {
      title: "Sabor-DIF RESTful API",
      version: "0.1.0",
      description:
        "Esta es un API RESTful para conectar la base de datos, aplicacion y pagina web",
      license: {
        name: "MIT",
        url: "https://spdx.org/licenses/MIT.html",
      },
      contact: {
        name: "",
        url: "",
        email: "",
      },
    },
    servers: [
      {
        url: "http://localhost:3000",
      },
    ],
  },
  apis: ["./routes/*.js"],
};

const specs = swaggerJsdoc(options);
app.use(
  "/api-docs",
  swaggerUi.serve,
  swaggerUi.setup(specs)
);
const cors = require("cors");

app.use(express.json())
app.use(cors());

const comensalRouter = require("./routes/comensal.js");
const comidaRouter = require("./routes/comida.js");
const responsableRouter = require("./routes/responsable.js");

app.use("/api/comensal", comensalRouter);
app.use("/api/comida", comidaRouter);
app.use("/api/responsable", responsableRouter);

const port = 8080;
app.listen(port, () => console.log(`Listening on port ${port}...`))
