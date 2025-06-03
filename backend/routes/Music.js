const express = require('express');
const router = express.Router();
const Music = require('../models/Music');

// POST /api/music
router.post('/music', async (req, res) => {
  const { title, description, url } = req.body;

  // Validation
  if (!title || !description || !url) {
    return res.status(400).json({ message: "Title, description, and URL are required" });
  }

  try {
    // Create new music entry
    const newMusic = await Music.create({ title, description, url });

    res.status(201).json({
      message: "Music added successfully",
      data: newMusic
    });
  } catch (error) {
    console.error("Error adding music:", error);
    res.status(500).json({ message: "Internal server error" });
  }
});

module.exports = router;
