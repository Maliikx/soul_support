const express = require('express');
const router = express.Router();
const authenticateToken = require('../middleware/authmiddleware');
const Patient = require('../models/Patient');

router.delete('/patient/:id', authenticateToken, async (req, res) => {
  const patientId = parseInt(req.params.id);
  const userId = parseInt(req.userId);

  console.log('Decoded userId:', userId);
  console.log('Requested patientId:', patientId);

  if (patientId !== userId) {
    return res.status(403).json({ message: 'Unauthorized to delete this patient' });
  }

  try {
    const patient = await Patient.findByPk(patientId);

    if (!patient) {
      return res.status(404).json({ message: 'Patient not found' });
    }

    await patient.destroy();
    res.json({ message: 'Patient deleted successfully' });
  } catch (error) {
    console.error('Error deleting account:', error);
    res.status(500).json({ error: 'Error deleting account' });
  }
});

module.exports = router;
