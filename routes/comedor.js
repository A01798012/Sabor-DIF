const express = require("express")
const router = express.Router();

// obtener nombres de comedores
router.get("/nombres", async function(req, res){
  try {
  
    res.status(201).send("Obtener comedores");
  } catch {

  }

});
//

module.exports = router;
