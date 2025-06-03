// routes/musicRoutes.js

const express = require('express');
const router = express.Router();
const Music = require('../models/Music');

// GET /api/music - fetch all music records
router.get('/', async (req, res) => {
  try {
    const musicList = await Music.findAll();
    res.json(musicList);
  } catch (error) {
    console.error('Error fetching music data:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;
