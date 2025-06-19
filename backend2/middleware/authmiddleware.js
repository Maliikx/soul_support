// backend/middleware/authmiddleware.js
const jwt = require('jsonwebtoken');

module.exports = function (req, res, next) {
  const authHeader = req.headers['authorization'];

  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({ message: 'No token, authorization denied' });
  }

  const token = authHeader.split(' ')[1];

  try {
    const decoded = jwt.verify(token, 'your_jwt_secret'); // Replace with process.env.JWT_SECRET ideally
    req.userId = decoded.id; // Token should contain { id: userId }
    next();
  } catch (err) {
    return res.status(401).json({ message: 'Token is not valid' });
  }
};
