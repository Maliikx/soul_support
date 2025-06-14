const express = require('express');
const router = express.Router();
const Notification = require('../models/Notification.js');
const Admin = require('../models/admin.js');


// POST: Send notification to patient
router.post('/doctor/:id', async (req, res) => {
  const { admin_id, patient_id, message } = req.body;

  try {
    if (!admin_id || !doctor_id || !message) {
      return res.status(400).json({ error: 'admin_id, doctor_id, and message are required.' });
    }

    const admin = await Admin.findOne({ where: { admin_id } });
    if (!admin) {
      return res.status(404).json({ error: 'Admin not found.' });
    }

    const notification = await Notification.create({
      admin_id,
      doctor_id,
      message,
      seen: false, // default to false
    });

    res.status(201).json({
      message: 'Notification sent successfully.',
      data: notification,
    });
  } catch (error) {
    console.error('Error sending notification:', error);
    res.status(500).json({ error: 'Failed to send notification.' });
  }
});

// GET: Fetch unseen notifications for patient and mark them seen
//router.get('/patient/:patientId', async (req, res) => {
//  const patientId = req.params.patientId;
//
//  try {
//    // Hardcoded test notifications
//    res.json([{ message: "Don't forget to do your daily exercises today!" }]);
//  } catch (error) {
//    console.error(error);
//    res.status(500).json({ error: 'Server error' });
//  }
//});
// GET: Fetch unseen notifications for patient and return screen-specific message
router.get('/doctor/:doctorId', async (req, res) => {
  const patientId = req.params.patientId;
  const screen = req.query.screen;

  try {
    let responseMessage = [];

    if (screen === 'reminder') {
      responseMessage.push({ message: "Don't forget to do your daily exercises today!" });
    } else if (screen === 'event') {
      responseMessage.push({ message: "We have An event are cooming soon in July!" });
    } else {
      responseMessage.push({ message: "Welcome back!" }); // default fallback
    }

    res.json(responseMessage);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Server error' });
  }
});


module.exports = router;
