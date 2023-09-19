const express = require("express")
const router = express.Router();

//Insertar/registrar comensal 
router.post("/registrar", async function(req, res){
  const comensal = {
    nombreComensal: req.body.nombreComensal,
    apellidoPaterno: req.body.apellidoPaterno,
    apellidoMaterno: req.body.apellidoMaterno,
    curp: req.body.curp
  };

  try {

    res.status(201).send("Registro");
  }catch(err){

  }
});

//TODO Obtener dependencias
router.get("/dependencias", async function(req, res){
  try {

    res.status(201).send("Obtener dependencias");
  }catch(err) {

  }

});
//TODO obtener todos los registrados pertenecientes a un comedor
router.get("/todos", async function(req, res){
  try {

    res.status(201).send("Obtener registrados");
  }catch(err) {

  }
});
//TODO 
//TODO 


//




module.exports = router;
