require('dotenv').config();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const crypto = require('crypto');
const Doctor = require('../models/Doctor');
const { hashPassword, comparePassword } = require("../secure/hashPassword");

// Nodemailer transporter
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    }
});

// Generate OTP
const generateOTP = () => crypto.randomInt(100000, 999999).toString();

// Register Doctor
const register = async (req, res) => {
    try {
        const { Name, Qualification, email, Age, Rating, NumberOfPatient, Calender, password } = req.body;

        let doctor = await Doctor.findOne({ where: { email } });

        if (doctor) {
            if (!doctor.isVerified) {
                const otp = generateOTP();
                const otpExpiry = new Date(Date.now() + 10 * 60 * 1000);
                await doctor.update({ otp, otpExpiry });

                await transporter.sendMail({
                    from: process.env.EMAIL_USER,
                    to: email,
                    subject: 'OTP Verification',
                    text: `Your OTP is: ${otp}`
                });

                return res.status(200).json({ message: 'OTP resent. Please check your email.' });
            }

            return res.status(400).json({ message: 'Doctor already exists and is verified. Please log in.' });
        }

        const hashedPassword = await hashPassword(password);
        const otp = generateOTP();
        const otpExpiry = new Date(Date.now() + 10 * 60 * 1000);

        doctor = await Doctor.create({
            Name,
            Qualification,
            email,
            Age,
            Rating,
            NumberOfPatient,
            Calender,
            password: hashedPassword,
            otp,
            otpExpiry
        });

        await transporter.sendMail({
            from: process.env.EMAIL_USER,
            to: email,
            subject: 'OTP Verification',
            text: `Your OTP is: ${otp}`
        });

        res.status(201).json({ message: 'Doctor registered. Please verify OTP sent to email.' });

    } catch (error) {
        console.error("Register Error:", error);
        res.status(500).json({ message: 'Error registering doctor', error });
    }
};

// Verify OTP
const verifyOTP = async (req, res) => {
    try {
        const { email, otp } = req.body;
        const doctor = await Doctor.findOne({ where: { email } });

        if (!doctor) return res.status(400).json({ message: 'Doctor not found' });
        if (doctor.isVerified) return res.status(400).json({ message: 'Doctor already verified' });

        if (doctor.otp !== otp || doctor.otpExpiry < new Date()) {
            return res.status(400).json({ message: 'Invalid or expired OTP' });
        }

        await doctor.update({ isVerified: true, otp: null, otpExpiry: null });
        res.json({ message: 'Email verified successfully. You can now log in.' });

    } catch (error) {
        console.error("Verify OTP Error:", error);
        res.status(500).json({ message: 'Error verifying OTP', error });
    }
};

// Resend OTP
const resendOTP = async (req, res) => {
    try {
        const { email } = req.body;
        const doctor = await Doctor.findOne({ where: { email } });

        if (!doctor) return res.status(400).json({ message: 'Doctor not found' });
        if (doctor.isVerified) return res.status(400).json({ message: 'Doctor already verified' });

        const otp = generateOTP();
        const otpExpiry = new Date(Date.now() + 10 * 60 * 1000);
        await doctor.update({ otp, otpExpiry });

        await transporter.sendMail({
            from: process.env.EMAIL_USER,
            to: email,
            subject: 'Resend OTP Verification',
            text: `Your new OTP is: ${otp}`
        });

        res.json({ message: 'OTP resent successfully.' });

    } catch (error) {
        console.error("Resend OTP Error:", error);
        res.status(500).json({ message: 'Error resending OTP', error });
    }
};

// Login
const login = async (req, res) => {
    try {
        const { email, password } = req.body;
        const doctor = await Doctor.findOne({ where: { email } });

        if (!doctor) return res.status(400).json({ message: 'Doctor not found' });
        if (!doctor.isVerified) return res.status(400).json({ message: 'Email not verified. Please verify OTP.' });

        const isPasswordValid = await comparePassword(password, doctor.password);
        if (!isPasswordValid) return res.status(400).json({ message: 'Incorrect password' });

        const token = jwt.sign(
            { id: doctor.doctor_id, email: doctor.email },
            process.env.JWT_SECRET,
            { expiresIn: '1d' }
        );

        res.status(200).json({
            message: 'Login successful',
            token,
            userId: doctor.doctor_id,
            username: doctor.Name
        });

    } catch (error) {
        console.error("Login Error:", error);
        res.status(500).json({ message: 'Error logging in', error });
    }
};

// Logout
const logout = (req, res) => {
    try {
        res.json({ message: 'Logged out successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Error logging out', error });
    }
};

// Forget Password
const forgetPassword = async (req, res) => {
    try {
        const { email } = req.body;

        if (!email) return res.status(400).send({ message: "Please provide email" });

        const doctor = await Doctor.findOne({ where: { email } });

        if (!doctor) return res.status(400).send({ message: "Doctor not found" });

        const token = jwt.sign({ email }, process.env.JWT_SECRET, {
            expiresIn: "1h",
        });

        const resetLink = `${process.env.CLIENT_URL}/reset-password/${token}`;

        await transporter.sendMail({
            from: process.env.EMAIL_USER,
            to: email,
            subject: "Password Reset Request",
            text: `Click on this link to reset your password: ${resetLink}`
        });

        return res.status(200).send({ message: "Password reset link sent to your email", token });

    } catch (error) {
        console.error("Forget Password Error:", error);
        return res.status(500).send({ message: "Something went wrong" });
    }
};

// Reset Password
const resetPassword = async (req, res) => {
    try {
        const { token } = req.params;
        const { password } = req.body;

        if (!password) return res.status(400).send({ message: "Please provide password" });

        let decoded;
        try {
            decoded = jwt.verify(token, process.env.JWT_SECRET);
        } catch (err) {
            return res.status(400).send({ message: "Invalid or expired token" });
        }

        const doctor = await Doctor.findOne({ where: { email: decoded.email } });

        if (!doctor) return res.status(400).send({ message: "Doctor not found" });

        const newHashedPassword = await hashPassword(password);
        doctor.password = newHashedPassword;
        await doctor.save();

        res.status(200).send({ message: "Password reset successfully" });

    } catch (error) {
        console.error("Reset Password Error:", error);
        res.status(500).send({ message: "Error resetting password", error });
    }
};

// Change Password
const changePassword = async (req, res) => {
    try {
        const { email, currentPassword, newPassword } = req.body;

        if (!email || !currentPassword || !newPassword) {
            return res.status(400).send({ message: "Please provide all required fields" });
        }

        const doctor = await Doctor.findOne({ where: { email } });

        if (!doctor) return res.status(400).send({ message: "Doctor not found" });

        const isMatch = await comparePassword(currentPassword, doctor.password);
        if (!isMatch) return res.status(400).send({ message: "Current password is incorrect" });

        doctor.password = await hashPassword(newPassword);
        await doctor.save();

        res.status(200).send({ message: "Password changed successfully" });

    } catch (error) {
        console.error("Change Password Error:", error);
        res.status(500).send({ message: "Error changing password", error });
    }
};

module.exports = {
    register,
    verifyOTP,
    resendOTP,
    login,
    logout,
    forgetPassword,
    resetPassword,
    changePassword
};
