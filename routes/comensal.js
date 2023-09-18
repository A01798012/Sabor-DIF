const express = require("express")
const router = express.Router();

//Insertar/registrar comensal 
router.post("/", async function(req, res){
  const comensal = {
    nombreComensal: req.body.nombreComensal,
    apellidoPaterno: req.body.apellidoPaterno,
    apellidoMaterno: req.body.apellidoMaterno,
    curp: req.body.curp
  };
});



//




module.exports = router;
