const express = require('express');
const router = express.Router();
const Pay=require('../models/pay');

router.get("/getpatientbytherapistid",async(req,res)=>{
const { therapist_id } = req.query;
    if (!therapist_id) {
    return res.status(400).json({
      status_code: 400,
      message: "!therapist_id is required"
    });
  }
  try{
    const payRecord= await Pay.findAll({
         where: {doctor_id: therapist_id },
         attributes: ['patient_id']
    });
    if (payRecord.length > 0) {
      const patientIds = payRecord.map(record => record.patient_id);
      res.status(200).json({
        status_code: 200,
        patient_ids: patientIds
      });
    } else {
      res.status(200).json({
        status_code: 200,
        patient_ids: [] // no patients found for this therapist
      });
    }

  } catch (error) {
    console.error("Error fetching patient IDs from pay table:", error);
    res.status(500).json({
      status_code: 500,
      message: "Internal server error"
    });
  }
})
module.exports = router;
