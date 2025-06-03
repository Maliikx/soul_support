const express = require('express');
const router = express.Router();
const patient = require('../models/Patient');

router.get("/getPatient_id",async(req,res)=>{
    const {email}=req.query
    if (!email) {
    return res.status(400).json({
      status_code: 400,
      message: "Email is required"
    });
  }
  try{
    const patientRecord= await patient.findOne({
         where: { email },
         attributes: [['Patient_id', 'id']]
    });
    if (patientRecord) {
      res.status(200).json({
        status_code: 200,
        id: patientRecord.get('id')
      });
    } else {
      res.status(404).json({
        status_code: 404,
        message: "Therapist not found"
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
