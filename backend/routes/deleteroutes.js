// Assuming you have Express and Sequelize set up
const express = require('express');
const router = express.Router();
const Patient = require('../models/Patient'); // Your Sequelize Patient model

// Middleware to authenticate user, e.g., via JWT token (you need to have this)
const authenticate = require('../middleware/authmiddleware');

router.post('/patient/delete', authenticate, async (req, res) => {
  try {
    // Assuming req.userId is set by authenticate middleware after verifying JWT
    const userId = req.userId;

    if (!userId) {
      return res.status(401).json({ message: 'Unauthorized' });
    }

    // Delete the patient record from DB
    const deleted = await Patient.destroy({
      where: { id: userId }
    });

    if (deleted) {
      return res.status(200).json({ message: 'Account deleted successfully' });
    } else {
      return res.status(404).json({ message: 'User not found' });
    }

  } catch (error) {
    console.error('Error deleting account:', error);
    return res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;
