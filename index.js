const express = require("express"),
  bodyParser = require("body-parser"),
  swaggerJsdoc = require("swagger-jsdoc"),
  swaggerUi = require("swagger-ui-express")
const mariadb = require("mariadb");
const app = express();

//creando una pool para hostear MariaDB
const pool = mariadb.createPool({
  host: 'localhost',
  user: 'your_db_user',
  password: 'your_db_password',
  database: 'your_db_name',
});

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

app.use("/api/comedor", comedorRouter);
app.use("/api/comensal", comensalRouter);
app.use("/api/comida", comidaRouter);
app.use("/api/responsable", responsableRouter);

const port = 8080;
app.listen(port, () => console.log(`Listening on port ${port}...`))
