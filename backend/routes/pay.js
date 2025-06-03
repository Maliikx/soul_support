const express = require('express');
const router = express.Router();
const Music = require('../models/pay');

// POST /api/music
router.post('/pay', async (req, res) => {
  const { patient_id, doctor_id, Amount,Date } = req.body;

  // Validation
  if (! patient_id || !doctor_id || !Amount || !Date) {
    return res.status(400).json({ message: "patient_id, doctor_id, Amount,Date " });
  }

  try {
    // Create new music entry
    const newpay = await Music.create({ patient_id, doctor_id, Amount,Date });

    res.status(201).json({
      message: "pay added successfully",
      data: newpay
    });
  } catch (error) {
    console.error("Error adding music:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

module.exports = router;
