const express = require("express");
const router = express.Router();

//TODO registrar comida para uno mismo
router.post("/registrar", async function(req, res){
  const comida = {
    curpComensal: req.body.curpComensal,
    idComedor: req.body.idComedor,
    aportacion: req.body.aportacion,
    //fecha en la base de datos o fecha aqui ????
  }
  try {
    res.status(201)
      .send(`${comida.curpComensal} comio e hizo un aporte de ${comida.aportacion}`);
  }catch(err) {

  }
});
//TODO registrar comida dependiente - depende
router.post("/registrar/dependiente", async function(req, res){
  const dependencia = {
    curpDepende: req.body.curpDepende,
    curpDependiente: req.body.curpDepende,

  };

  try {
    res.status(201).send("Obtener dependencias");
  }catch(err) {

  }
});
//TODO 

module.exports = router;
