const express = require("express"),
  bodyParser = require("body-parser"),
  swaggerJsdoc = require("swagger-jsdoc"),
  swaggerUi = require("swagger-ui-express")
const https = require("https");
const fs = require("fs");
const app = express();


//Configurando swagger y los formatos
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
        url: "http://localhost:8080/api/",
      },
    ],
  },
  apis: ["./routes/*.js"],
};

const specs = swaggerJsdoc(options);
app.use(
  "/api-docs",
  swaggerUi.serve,
  swaggerUi.setup(specs, {explorer: true})
);
const cors = require("cors");

app.use(express.json())
app.use(cors());
const comedorRouter = require("./routes/comedor.js");
const comensalRouter = require("./routes/comensal.js");
const comidaRouter = require("./routes/comida.js");
const responsableRouter = require("./routes/responsable.js");
const condicionRouter = require("./routes/condicion.js");
const aperturaRouter = require("./routes/apertura.js");

app.use("/api/comedor", comedorRouter);
app.use("/api/comensal", comensalRouter);
app.use("/api/comida", comidaRouter);
app.use("/api/responsable", responsableRouter);
app.use("/api/condicion", condicionRouter);
app.use("/api/apertura", aperturaRouter);

const port = 3000;
app.listen(port, () => console.log(`Listening on port http://10.48.87.62:${port}...`))
