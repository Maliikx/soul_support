// const express = require('express');
// const router = express.Router();
// const therapist=require('../models/doctor');


// router.get("/get_therapistName",(req,res)=>{
// if(doctor_id.length>0){
// res.status(200).send({
//     'status_code':200 ,
//     "doctor":name,
// })
// }
// else{
//     res.status(200).send({
//     'status_code':200 ,
//     "doctor":[],
// })
// }


// })
const express = require('express');
const router = express.Router();
const therapist = require('../models/Doctor');

// Get all doctor names
router.get("/get_therapistName", async (req, res) => {
  try {
    const doctors = await therapist.findAll({
      attributes: ['name'] // Fetch only the 'name' column
    });

    if (doctors.length > 0) {
      res.status(200).json({
        status_code: 200,
        doctor: doctors
      });
    } else {
      res.status(200).json({
        status_code: 200,
        doctor: []
      });
    }
  } catch (error) {
    console.error("Error fetching therapist names:", error);
    res.status(500).json({
      status_code: 500,
      message: "Internal server error"
    });
  }
});

module.exports = router;
