const express = require('express');
const router = express.Router();
const doctor = require('../models/Doctor');

router.get("/getdoctor1_id",async(req,res)=>{
    const {name}=req.query
    if (!name) {
    return res.status(400).json({
      status_code: 400,
      message: "name is required"
    });
  }
  try{
    const doctorRecord= await doctor.findOne({
         where: { name },
         attributes: [['doctor_id', 'id']]
    });
    if (doctorRecord) {
      res.status(200).json({
        status_code: 200,
        id: doctorRecord.get('id')
      });
    } else {
      res.status(404).json({
        status_code: 404,
        message: "doctor not found"
      });
    }
  }catch (error) {
    console.error("Error fetching therapist ID:", error);
    res.status(500).json({
      status_code: 500,
      message: "Internal server error"
    });
  }
})
module.exports = router;
