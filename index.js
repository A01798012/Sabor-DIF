const express = require("express");
const app = express();
app.use(express.json())
const cors = require("cors");

app.use(cors());

const comensalRouter = require("./routes/comensal.js");
const comidaRouter = require("./routes/comida.js");
const responsableRouter = require("./routes/responsable.js");

app.use("/api/comensal", comensalRouter);
app.use("/api/comida", comidaRouter);
app.use("/api/responsable", responsableRouter);

const port = 8080;
app.listen(port, () => console.log(`Listening on port ${port}...`))
