const express = require('express');
const passport = require('passport');
const router = express.Router();
const Doctor = require('../models/Doctor');

const {
    register,
    verifyOTP,
    resendOTP,
    login,
    logout,
//    dashboard,
    forgetPassword,
    resetPassword,
    changePassword,
//    getAllUsers,
} = require('../controllers/authControllers.js');

const authMiddleware = require('../middleware/authmiddleware.js');

// Routes
router.post('/register', register);
router.post('/verify-otp', verifyOTP);
router.post('/resend-otp', resendOTP);
router.post('/login', login);
router.post('/logout', logout);
//router.get('/dashboard', authMiddleware, dashboard);
router.post('/forget-password', forgetPassword);
router.post('/reset-password/:token', resetPassword);
router.post('/change-password', changePassword);
//router.get('/getusers', getAllUsers);

//  Google OAuth Routes
//router.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));
//router.get('/auth/google/callback',
//    passport.authenticate('google', { session: false, failureRedirect: '/login' }),
//    (req, res) => {
//        res.json({
//            message: 'Google login successful',
//            token: req.user.token
//        });
//    }
//);

module.exports = router;
