const express = require("express");
const router = express.Router();

//TODO registrar comida
router.post("/", async function(req, res){
  const comida = {
    curpComensal: req.body.curpComensal,
    idComedor: req.body.idComedor,
    aportacion: req.body.aportacion,
    //fecha en la base de datos o fecha aqui ????
  }
});

module.exports = router;
