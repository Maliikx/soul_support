require('dotenv').config();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const crypto = require('crypto');
const User = require('../models/Patient');
const { hashPassword, comparePassword } = require("../secure/hashPassword");

// Email Transporter Setup
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'soul6789907@gmail.com',
        pass: 'nfpftevvlbbqbmpf'
    }
});

// Generate OTP
const generateOTP = () => crypto.randomInt(100000, 999999).toString();

// ----- Function Definitions -----

const register = async (req, res) => {
    try {
        const { FirstName, PhoneNumber, Gender, email, password } = req.body;
        let user = await User.findOne({ where: { email } });

        if (user) {
            if (!user.isVerified) {
                const otp = generateOTP();
                const otpExpiry = new Date(Date.now() + 10 * 60 * 1000);
                await user.update({ otp, otpExpiry });

                await transporter.sendMail({
                    from: 'soul6789907@gmail.com',
                    to: email,
                    subject: 'OTP Verification',
                    text: `Your OTP is: ${otp}`
                });

                return res.status(200).json({ message: 'OTP resent. Please check your email.' });
            }

            return res.status(400).json({ message: 'User already exists and is verified. Please log in.' });
        }

        const hashedPassword = await bcrypt.hash(password, 10);
        const otp = generateOTP();
        const otpExpiry = new Date(Date.now() + 10 * 60 * 1000);

        user = await User.create({ FirstName, PhoneNumber, Gender, email, password: hashedPassword, otp, otpExpiry });

        await transporter.sendMail({
            from: 'soul6789907@gmail.com',
            to: email,
            subject: 'OTP Verification',
            text: `Your OTP is: ${otp}`
        });

        res.status(201).json({ message: 'User registered. Please verify OTP sent to email.' });
    } catch (error) {
        res.status(500).json({ message: 'Error registering user', error });
    }
};

const verifyOTP = async (req, res) => {
    try {
        const { email, otp } = req.body;
        const user = await User.findOne({ where: { email } });

        if (!user) return res.status(400).json({ success: false, message: 'User not found' });
        if (user.isVerified) return res.status(400).json({ success: false, message: 'User already verified' });

        if (user.otp !== otp || user.otpExpiry < new Date()) {
            return res.status(400).json({ success: false, message: 'Invalid or expired OTP' });
        }

        await user.update({ isVerified: true, otp: null, otpExpiry: null });
        res.json({ success: true, message: 'Email verified successfully. You can now log in.' });
    } catch (error) {
        res.status(500).json({ success: false, message: 'Error verifying OTP', error });
    }
};


const resendOTP = async (req, res) => {
    try {
        const { email } = req.body;
        const user = await User.findOne({ where: { email } });

        if (!user) return res.status(400).json({ message: 'User not found' });
        if (user.isVerified) return res.status(400).json({ message: 'User already verified' });

        const otp = generateOTP();
        const otpExpiry = new Date(Date.now() + 10 * 60 * 1000);
        await user.update({ otp, otpExpiry });

        await transporter.sendMail({
            from: 'soul6789907@gmail.com',
            to: email,
            subject: 'Resend OTP Verification',
            text: `Your new OTP is: ${otp}`
        });

        res.json({success: true, message: 'OTP resent successfully.' });
    } catch (error) {
        res.status(500).json({ message: 'Error resending OTP', error });
    }
};
const login = async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ where: { email } });

        if (!user) return res.status(400).json({ message: 'User not found' });
        if (!user.isVerified) return res.status(400).json({ message: 'Email not verified. Please verify OTP.' });

        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) return res.status(400).json({ message: 'Incorrect password' });

        //  Generate the token correctly
        const token = jwt.sign(
            { id: user.patient_id, email: user.email },
            process.env.JWT_SECRET,
            { expiresIn: '1d' }
        );

        //  Send the response
        res.status(200).json({
            message: 'Login successful',
            token,
            userId: user.patient_id,
            username: user.FirstName
        });

    } catch (error) {
        console.error("Login error:", error);
        res.status(500).json({ message: 'Error logging in', error });
    }
};

const logout = (req, res) => {
    try {
        res.json({ message: 'Logged out successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Error logging out', error });
    }
};

//const dashboard = async (req, res) => {
//    try {
//        res.json({ message: `Welcome to the dashboard, ${req.user.email}` });
//    } catch (error) {
//        res.status(500).json({ message: 'Error accessing dashboard', error });
//    }
//};

const forgetPassword = async (req, res) => {
  try {
    const { email } = req.body;

    if (!email) {
      return res.status(400).send({ message: "Please provide email" });
    }

    const checkUser = await User.findOne({ where: { email } });

    if (!checkUser) {
      return res.status(400).send({ message: "User not found. Please register." });
    }

    const token = jwt.sign({ email }, process.env.JWT_SECRET, {
      expiresIn: "1h",
    });

    const transporter = nodemailer.createTransport({
      service: "gmail",
      secure: true,
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      },
    });

    const receiver = {
      from: process.env.EMAIL_USER,
      to: email,
      subject: "Password Reset Request",
      text: `Click on this link to reset your password: ${process.env.CLIENT_URL}/reset-password/${token}`,
    };

    await transporter.sendMail(receiver);

    return res.status(200).send({
      message: "Password reset link sent successfully to your email",
       token,
    });
  } catch (error) {
    console.error("Forget Password Error:", error);
    return res.status(500).send({ message: "Something went wrong" });
  }
};
const resetPassword = async (req, res) => {
    try {
        const { token } = req.params;
        const { password } = req.body;

        // Validate password field
        if (!password) {
            return res.status(400).send({ message: "Please provide password" });
        }

        // Decode JWT token
        let decoded;
        try {
            console.log("Verifying token:", token); // Log token for debugging
            decoded = jwt.verify(token, process.env.JWT_SECRET);
        } catch (err) {
            console.error("Token verification failed:", err); // Log error
            return res.status(400).send({ message: "Invalid or expired token" });
        }

        // Find the user by decoded email
        const user = await User.findOne({ where: { email: decoded.email } });

        if (!user) {
            return res.status(400).send({ message: "User not found" });
        }

        // Hash the new password
        const newhashPassword = await hashPassword(password);
        user.password = newhashPassword;
        await user.save();

        res.status(200).send({ message: "Password reset successfully" });
    } catch (error) {
        console.error("Error resetting password:", error);
        res.status(500).send({ message: "Something went wrong while resetting password", error });
    }
};

const changePassword = async (req, res) => {
    try {
        const { email, currentPassword, newPassword } = req.body;

        // Validate inputs
        if (!email || !currentPassword || !newPassword) {
            return res.status(400).send({ message: "Please provide all required fields" });
        }

        // Find the user by email
        const checkUser = await User.findOne({ where: { email } });

        if (!checkUser) {
            return res.status(400).send({ message: "User not found" });
        }

        // Compare the current password
        const isMatchPassword = await comparePassword(currentPassword, checkUser.password);

        if (!isMatchPassword) {
            return res.status(400).send({ message: "Current password is incorrect" });
        }

        // Hash the new password
        const newHashPassword = await hashPassword(newPassword);
        checkUser.password = newHashPassword;
        await checkUser.save();

        res.status(200).send({ message: "Password changed successfully" });
    } catch (error) {
        console.error("Error changing password:", error);
        res.status(500).send({ message: "Something went wrong while changing password", error });
    }
};
//const getAllUsers = async (req, res) => {
//    try {
//        const users = await User.findAll(); // Sequelize uses `findAll` to get all records
//
//        if (!users || users.length === 0) {
//            return res.status(404).send({ message: "No users found" });
//        }
//
//        res.status(200).send({ message: "Users found", users });
//    } catch (error) {
//        console.error("Error fetching users:", error);
//        res.status(500).send({ message: "Something went wrong while fetching users", error });
//    }
//};
//
//const GoogleStrategy = require('passport-google-oauth20').Strategy;
//const passport = require('passport');
//
//// Passport Setup for Google
//passport.use(new GoogleStrategy({
//    clientID: process.env.GOOGLE_CLIENT_ID,
//    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
//    callbackURL: '/api/auth/auth/google/callback'
//},
//async (accessToken, refreshToken, profile, done) => {
//    try {
//        const email = profile.emails[0].value;
//        let user = await User.findOne({ where: { email } });
//
//        if (!user) {
//            user = await User.create({
//                FirstName: profile.displayName,
//                email: email,
//                isVerified: true,
//                password: await bcrypt.hash(crypto.randomBytes(10).toString('hex'), 10)
//            });
//        }
//
//        const token = jwt.sign({ id: user.patient_id, email: user.email }, process.env.JWT_SECRET, { expiresIn: '1h' });
//        user.token = token;
//
//        done(null, user);
//    } catch (error) {
//        done(error, null);
//    }
//}));
//
//

module.exports = {
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
};
